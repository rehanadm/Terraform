# Creating VPCs and Subnets Manually in AWS

## Introduction

In this exercise, we will focus on manually building a simple VPC-subnet infrastructure on the AWS Console. This includes creating a VPC, two subnets (one public and one private), an Internet Gateway, and a public route table. By creating these elements manually, we will gain a deeper understanding of how intricate and challenging the process of creating and managing infrastructure can be. This will provide a foundation for appreciating the benefits of Infrastructure as Code (IaC) in automating these tasks and maintaining consistency across environments.

## Desired Outcome

If you wish to give it a shot before looking at the detailed step-by-step and the solution videos, here is an overview of what the created solution should deploy:

1. A VPC with a CIDR block of `10.0.0.0/16`.
2. One public subnet with a CIDR block of `10.0.0.0/24`.
3. One private subnet with a CIDR block of `10.0.1.0/24`.
4. One Internet Gateway.
5. One public route table with a route to the Internet Gateway, and the correct association between the public subnet and the public route table.

## Step-by-Step Guide
Step-by-Step Guide: Create AWS VPC with Public and Private Subnets (Manual Method)
1. Login to your AWS Management Console.
2. Search for VPC in the AWS services search bar and open the VPC Dashboard.
3. Make sure the AWS region is set to US West (Oregon) – us-west-2.
4. From the left navigation panel, click Your VPCs, then click Create VPC.
5. Select VPC only.
6. Enter the following details:
- Name tag: Demo-VPC
- IPv4 CIDR block: 10.0.0.0/16
- IPv6 CIDR block: No IPv6 CIDR block
- Tenancy: Default

7. Enable DNS resolution and DNS hostnames under Additional settings.

8. Add the following tags:
- Environment = Dev
- Project = Terraform-VPC-Lab
- ManagedBy = Manual

9. Click Create VPC.
10. Go back to the VPC Dashboard and click Subnets.
11. Click Create subnet.
12. Select the VPC you just created (Demo-VPC).
13. Enter the following details to create the public subnet:
- Subnet name: Public-Subnet
- Availability Zone: Select an AZ in us-west-2
- IPv4 subnet CIDR block: 10.0.0.0/24

14. Add the following tags:
- Type = Public
- Environment = Dev
- Project = Terraform-VPC-Lab
- ManagedBy = Manual

15. Click Create subnet.
16. Select Public-Subnet, click Actions, then select Edit subnet settings.
17. Enable Enable auto-assign public IPv4 address and click Save.
18. Go back to Subnets and click Create subnet again.
19. Select the same VPC (Demo-VPC) and enter the following details to create the private subnet:
- Subnet name: Private-Subnet
- Availability Zone: Select an AZ in us-west-2
- IPv4 subnet CIDR block: 10.0.1.0/24

20. Add the following tags:
- Type = Private
- Environment = Dev
- Project = Terraform-VPC-Lab
- ManagedBy = Manual

21. Click Create subnet. Do not enable automatic public IPv4 assignment for the private subnet.
22. Go back to the VPC Dashboard and click Internet Gateways.
23. Click Create internet gateway.
24. Enter the Name tag as Demo-Internet-Gateway.
25. Add the following tags:
- Environment = Dev
- Project = Terraform-VPC-Lab
- ManagedBy = Manual

26. Click Create internet gateway.
27. Select the Internet Gateway you just created,click Actions,then select Attach to VPC.
28. Select your VPC (Demo-VPC) and click Attach internet gateway.
29. Go back to the VPC Dashboard and click Route Tables.
30. Click Create route table.
31. Enter the following details:
- Name: Public-Route-Table
- VPC: Demo-VPC

32. Add the following tags:
- Environment = Dev
- Project = Terraform-VPC-Lab
- ManagedBy = Manual

33. Click Create route table.
34. Select Public-Route-Table and open the Routes tab.
35. Click Edit routes, then click Add route.
36. Enter the following route details:
- Destination: 0.0.0.0/0
- Target: Internet Gateway
- Select: Demo-Internet-Gateway

37. Click Save changes.
38. Select the Subnet associations tab.
39. Click Edit subnet associations.
40. Select Public-Subnet and click Save associations.
41. Go back to the VPC Dashboard and verify that all resources have been created successfully with their respective Name tags.

42. Verify the following route table entries:
- 10.0.0.0/16 → local
- 0.0.0.0/0 → Demo-Internet-Gateway

43. Verify that Public-Subnet is associated with Public-Route-Table.
44. Verify that Private-Subnet is not associated with the public route table. It will use the VPC's main route table by default.
45. Your AWS VPC infrastructure is now ready.

Note: The public subnet has a route to the Internet Gateway, while the private subnet has no direct internet route. To provide outbound internet access to private instances, you will need to configure a NAT Gateway and a separate private route table.