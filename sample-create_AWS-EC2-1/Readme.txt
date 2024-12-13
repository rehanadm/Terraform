Deploy EC2 instance on AWS using terraform
files==> main.tf

1. Provider = The provider block tells Terraform which cloud service to interact

2. access_key/secret_key = specifies the credentials and configuration necessary for it to interact with AWS. 

3. region =  The AWS region where resources will be deployed. In your case, us-east-1 (North Virginia) is specified

4. terraform required version = specify the version of Terraform that is required for your configuration to work. This ensures compatibility with specific Terraform features.
In this case, you want the version to be less than or equal to 1.10.0

5. resource = aws_instance, This defines an EC2 instance resource. The aws_instance is a Terraform resource type used to deploy EC2 instances on AWS.

6. ami = The ami parameter specifies the ID of the Amazon Machine Image (AMI) used to launch the EC2 instance. An AMI is essentially a pre-configured image that contains the operating system and potentially some software.

7. instance type = The instance_type defines the type (or size) of the EC2 instance to be launched. t2.micro is one of the smallest and cheapest instance types, suitable for light workloads.

8. key name = The key_name refers to the SSH key pair used to securely access the EC2 instance. AWS uses public/private key pairs for SSH access.

9. subnet id = The subnet_id specifies the subnet within your Virtual Private Cloud (VPC) where the EC2 instance will be deployed. This defines the network segment where the instance resides.

10. tags = Tags are key-value pairs used to label your AWS resources for easier management.

11. resource = aws_eip, The aws_eip resource creates an Elastic IP (EIP), which is a static, public IP address that you can associate with your EC2 instance.

12. instance = aws_instance.terraform-server.id (refers to the unique ID of the instance terraform-server that was created by the aws_instance resource.)

13. vpc = true, 
