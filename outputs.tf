output "ec2_global_ips" { 

  value = ["${aws_instance.ec2.*.public_ip}"]
}

output "ec2_public_ip" {
    value = aws_instance.ec1.public_ip
  
}

output "ami_id" {

    value = aws_instance.ec2.ami
}