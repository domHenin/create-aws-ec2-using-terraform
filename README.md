
# Create AWS EC2 using Terraform

An AWS EC2 instance is a virtual machine that you host in a virtual private cloud. I required a few infrastructure components before I could create an EC2 instance in my AWS account. These were:

1. A VPC.
2. A subnet in the VPC.
3. A route table in the VPC associated with the subnet.
4. An internet gateway in the VPC.
5. A route in the route table to allow network traffic from the EC2 instance to the internet.
6. A security group.
7. A network interface associated with the subnet and the security group.
8. And an elastic IP that is associated with the network interface.
I stored the Terraform code associated with this project at ec2-userdata-terraform.
As I listed above, I created eight types of infrastructure components before launching an EC2 instance in my AWS account. I’ll briefly mention what these components are and how and why they are necessary.
Note: The best resource to study for AWS networking is the AWS-Docs. That is my go-to resource for any clarifications. It could be exhaustive to go through it, but it is worth it.


----

[How-To Guide](https://skundunotes.com/2021/11/01/create-aws-ec2-using-terraform/)