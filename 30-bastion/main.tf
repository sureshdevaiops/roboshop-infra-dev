resource "aws_instance" "bastion" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  subnet_id     = local.public_subnet_id
  vpc_security_group_ids = [local.bastion_sg_id]
  iam_instance_profile = aws_iam_instance_profile.bastion.name

  user_data = templatefile("${path.module}/bastion.sh.tftpl", {
    partition_number = 4
    extra_disk_size    = 20
  })
  user_data_replace_on_change = true

  # we are going to run terraform commands from this instance, so it needs more disk
  root_block_device {
    volume_type           = "gp3"
    volume_size           = 50

    tags = local.common_tags
  }

  tags = local.common_tags
}