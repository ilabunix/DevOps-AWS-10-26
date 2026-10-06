$ErrorActionPreference = "Stop"

function Return-Decision {
    param([ValidateSet("deny","ask")][string]$Decision,[string]$Reason,[string]$Category)
    $state = if ($Decision -eq "deny") { "BLOCKED" } else { "APPROVAL REQUIRED" }
    $message = "$state BY CLOUDOPS GUARD [$Category]`n`n$Reason`n`nDo not bypass this control. Show the exact proposed action to the user, explain why it is needed, what it will access/change, expected effect, risk, and validation. Wait for explicit approval when approval is allowed."
    @{ hookSpecificOutput = @{ hookEventName="PreToolUse"; permissionDecision=$Decision; permissionDecisionReason=$message } } | ConvertTo-Json -Depth 8 -Compress
    exit 0
}

try {
    $raw = [Console]::In.ReadToEnd()
    if ([string]::IsNullOrWhiteSpace($raw)) { exit 0 }
    $obj = $raw | ConvertFrom-Json
    $toolName = [string]$obj.tool_name

    if ($toolName -match '^(WebSearch|WebFetch)$') {
        Return-Decision "ask" "Internet search/fetch requires explicit user approval first." "INTERNET ACCESS"
    }

    if ($toolName -notin @("Bash","PowerShell")) { exit 0 }

    $cmd = ([string]$obj.tool_input.command) -replace "`r",""
    if ([string]::IsNullOrWhiteSpace($cmd)) { exit 0 }

    if ($cmd -match '(?im)(^|[\s;&|()])aws(?:\.exe)?(?=\s|$)') {
        Return-Decision "deny" "All AWS CLI commands are manual-only, including read-only commands." "AWS CLI"
    }

    if ($cmd -match '(?im)(^|[\s;&|()])(?:Get|Set|New|Remove|Update|Write|Read|Start|Stop|Invoke|Edit|Add|Clear|Copy|Move|Restore|Reset|Enable|Disable)-AWS[A-Za-z0-9]*\b') {
        Return-Decision "deny" "AWS PowerShell cmdlets are manual-only." "AWS POWERSHELL"
    }

    if ($cmd -match '(?im)(^|[\s;&|()])terraform(?:\.exe)?\s+plan(?:\s|$)') {
        Return-Decision "deny" "terraform plan is manual-only." "TERRAFORM PLAN"
    }

    if ($cmd -match '(?im)(^|[\s;&|()])terraform(?:\.exe)?\s+(apply|destroy|state|import|taint|untaint|force-unlock)(?:\s|$)') {
        Return-Decision "deny" "This Terraform operation is blocked/manual-only." "TERRAFORM MUTATION"
    }

    if ($cmd -match '(?im)(^|[\s;&|()])git(?:\.exe)?\s+(add|commit|push)(?:\s|$)') {
        Return-Decision "deny" "Git add/commit/push are manual-only." "GIT MUTATION"
    }

    if ($cmd -match '(?im)(^|[\s;&|()])git(?:\.exe)?\s+reset\s+--hard(?:\s|$)') {
        Return-Decision "deny" "git reset --hard is blocked." "GIT RESET"
    }

    if ($cmd -match '(?im)(^|[\s;&|()])git(?:\.exe)?\s+clean(?:\s|$).*-[^\r\n]*f') {
        Return-Decision "deny" "Destructive git clean is blocked." "GIT CLEAN"
    }

    if ($cmd -match '(?im)(^|[\s;&|()])(curl|curl\.exe|wget|wget\.exe)(?=\s|$)|\b(Invoke-WebRequest|iwr|Invoke-RestMethod|irm|Start-BitsTransfer)\b') {
        Return-Decision "ask" "Web/network download or REST access requires explicit approval." "INTERNET DOWNLOAD/FETCH"
    }

    if ($cmd -match '(?im)(^|[\s;&|()])git(?:\.exe)?\s+(clone|fetch|pull|ls-remote|remote\s+update)(?:\s|$)') {
        Return-Decision "ask" "Remote Git access requires explicit approval." "GIT NETWORK ACCESS"
    }

    if ($cmd -match '(?im)(^|[\s;&|()])(winget|choco|chocolatey|scoop)(?:\.exe)?\s+(install|upgrade|update|source)(?:\s|$)|(^|[\s;&|()])(npm|npx|pnpm|yarn)(?:\.cmd|\.exe)?\s+(install|i|add|update|upgrade|exec|dlx)(?:\s|$)|(^|[\s;&|()])(pip|pip3|python\s+-m\s+pip|py\s+-m\s+pip)(?:\.exe)?\s+install(?:\s|$)') {
        Return-Decision "ask" "Package download/install requires explicit approval." "PACKAGE DOWNLOAD"
    }

    if ($cmd -match '(?im)(^|[\s;&|()])rm\s+(-[^\r\n;|]*r[^\r\n;|]*f|-[^\r\n;|]*f[^\r\n;|]*r)(?:\s|$)|\bRemove-Item\b[^\r\n;|]*(?:-Recurse|-Force)') {
        Return-Decision "deny" "Destructive filesystem operation is blocked." "DESTRUCTIVE FILESYSTEM"
    }

    exit 0
}
catch {
    Return-Decision "deny" ("Guard could not safely evaluate the operation: " + $_.Exception.Message) "GUARD ERROR"
}
