output "vpc_id" {
  value = module.vpc.vpc_id
}
output "natgw_ids" {
  value = module.vpc.natgw_ids
}
output "igw_id" {
  value = module.vpc.igw_id
}
output "security_group_id" {
  value = module.vpc.default_security_group_id
}
output "security_group"{
  value=aws_security_group.eks_security_group.id
}
output "Cluster_name"{
  value=module.eks.cluster_name
}