environment = "preprod"
bucket_name = "application-s3-bucket-9024"
S3_kms_master_key_id = "arn:aws:kms:us-east-1:534811117031:key/85deebe1-8047-42be-a0eb-0bb0c79bc2a7"
s3_bucket_acl ="public-read"
s3_bucket_versioning = "Enabled"
tags={
    environment = "prod"
    region      = "us-east-1"
    namespace   = "peak"
}