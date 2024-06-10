<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.30 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.49.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_admin_user"></a> [admin\_user](#module\_admin\_user) | ../modules | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_group.admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_policy.admin_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy) | resource |
| [aws_instance.ec2_ubuntu_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_s3_bucket.lambda_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_security_group.main_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.allow_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_subnet.main_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_iam_policy_document.admin_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_ips"></a> [allowed\_ips](#input\_allowed\_ips) | List of allowed IPs to access the EC2 instance | `list(string)` | n/a | yes |
| <a name="input_lambda_bucket_name"></a> [lambda\_bucket\_name](#input\_lambda\_bucket\_name) | Name of the S3 bucket that holds Lambda functions | `string` | `"katies-lambda-bucket"` | no |
| <a name="input_ubuntu_ami"></a> [ubuntu\_ami](#input\_ubuntu\_ami) | Ubuntu AMI to install on EC2 instance | `string` | `"ami-0c7217cdde317cfec"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_iam_group_id"></a> [admin\_iam\_group\_id](#output\_admin\_iam\_group\_id) | n/a |
| <a name="output_instance_arn"></a> [instance\_arn](#output\_instance\_arn) | n/a |
| <a name="output_private_instance_ip"></a> [private\_instance\_ip](#output\_private\_instance\_ip) | n/a |
| <a name="output_public_instance_ip"></a> [public\_instance\_ip](#output\_public\_instance\_ip) | n/a |
<!-- END_TF_DOCS -->