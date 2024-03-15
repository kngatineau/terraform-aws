# terraform-aws
#### Tables are auto-generated using `terraform docs`

## Introduction
This repo serves as a playground for me to poke around with AWS free-tier resources. I plan on hosting an updated version of my college project [Pear—the Discord User Pairing Bot](https://github.com/kngatineau/pear_discord_bot) on the EC2 instance for private access.

A free-version Puppet repo will eventually be in the works to manage the configuration on the instance(s) for all things Pear.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.30 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.40.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.1 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.5 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.ec2_ubuntu_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.ssh_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [local_sensitive_file.ssh_pem](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/sensitive_file) | resource |
| [tls_private_key.ssh_private_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gen_pem_file"></a> [gen\_pem\_file](#input\_gen\_pem\_file) | Generate a new PEM file for the EC2 key pair | `bool` | `false` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Name of the EC2 key pair | `string` | `"default"` | no |
| <a name="input_ubuntu_ami"></a> [ubuntu\_ami](#input\_ubuntu\_ami) | Ubuntu AMI to install on EC2 instance | `string` | `"ami-0c7217cdde317cfec"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_arn"></a> [instance\_arn](#output\_instance\_arn) | n/a |
| <a name="output_private_instance_ip"></a> [private\_instance\_ip](#output\_private\_instance\_ip) | n/a |
| <a name="output_public_instance_ip"></a> [public\_instance\_ip](#output\_public\_instance\_ip) | n/a |

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->