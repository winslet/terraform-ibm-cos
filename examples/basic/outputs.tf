output "bucket_name" {
  description = "Bucket name"
  value       = module.cos.bucket_name
}

output "bucket_crn" {
  description = "Bucket CRN"
  value       = module.cos.bucket_crn
}

output "bucket_id" {
  description = "Bucket id"
  value       = module.cos.bucket_id
}
