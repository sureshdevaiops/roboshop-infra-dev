locals {
    ami_id = data.aws_ami.joindevops.id
     mongodb_sg_id = split(",", data.aws_ssm_parameter.mongodb_sg_id.value)[0]
     redis_sg_id = split(",", data.aws_ssm_parameter.redis_sg_id.value)[0]

     database_subnet_id = split(",", data.aws_ssm_parameter.database_subnet_ids.value)[0]
    common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = "true"
        Name = "${var.project}-${var.environment}-mongodb"
    }
    
}