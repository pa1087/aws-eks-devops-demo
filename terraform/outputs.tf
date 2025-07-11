output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}
output "region" {
  description = "AWS region"
  value       = "us-east-1"
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}