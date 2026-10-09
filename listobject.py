def list_all_objects(s3, bucket, prefix=""):
    """
    Lists actual files under a prefix while preserving
    S3 folder-marker objects.
    """

    paginator = s3.get_paginator("list_objects_v2")

    for page in paginator.paginate(
        Bucket=bucket,
        Prefix=prefix,
    ):
        for obj in page.get("Contents", []):
            if obj["Key"].endswith("/"):
                continue

            yield obj