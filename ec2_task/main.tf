resource "aws_instance" "ec2_user" {
  for_each                = {for i in var.instance:i.instance_name=>i}
  ami                     = lookup(each.value,"ami","ami-0c7217cdde317cfec")
  instance_type           = lookup(each.value, "instance_type","t2.micro")
  iam_instance_profile    = lookup(each.value,"iam_instance_profile","ssm_role")
  vpc_security_group_ids  = [aws_security_group.allow_tls.id]
  subnet_id               = data.terraform_remote_state.peak.outputs.public_subnet_id[0]
  key_name                = lookup(each.value,"key_name","vikas6400")
 tags = merge(var.tags, {
    Name : each.key
  })
}
