variable "cluster_name" {
  description = "What to name the cluster and all of its associated resources"
  type        = string
  default     = "nomad-example"
}

variable "vpc_id" {
  description = "The ID of the VPC in which the nodes will be deployed.  Uses default VPC if not supplied."
  type        = string
  default     = ""
}

variable "aws_access_key_id" {
  description = "AWS access key id."
  type        = string
  default     = ""
}

variable "aws_secret_access_key" {
  description = "AWS secret access key."
  type        = string
  default     = ""
}