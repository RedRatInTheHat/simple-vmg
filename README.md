# Создание простой группы виртуальных машин

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >=0.119.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | >=0.119.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_compute_instance_group.vm-group](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance_group) | resource |
| [yandex_compute_image.image](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/compute_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_boot_disk_size"></a> [boot\_disk\_size](#input\_boot\_disk\_size) | The size of the boot disk | `number` | `10` | no |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | The name of the instance group. | `string` | n/a | yes |
| <a name="input_has_nat"></a> [has\_nat](#input\_has\_nat) | Is a public address provided. | `bool` | `false` | no |
| <a name="input_image_family"></a> [image\_family](#input\_image\_family) | The family name of an image. Used to search the latest image in a family. | `string` | `"ubuntu-2004-lts"` | no |
| <a name="input_instances_count"></a> [instances\_count](#input\_instances\_count) | Number of instances | `number` | `1` | no |
| <a name="input_max_expansion"></a> [max\_expansion](#input\_max\_expansion) | The maximum number of instances that can be temporarily allocated above the group's target size during the update process. | `number` | `0` | no |
| <a name="input_max_unavailable"></a> [max\_unavailable](#input\_max\_unavailable) | The maximum number of running instances that can be taken offline (stopped or deleted) at the same time during the update process. | `number` | `1` | no |
| <a name="input_metadata"></a> [metadata](#input\_metadata) | Metadata for user creation. | `object({ user-data = string })` | n/a | yes |
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | The ID of the network. | `string` | n/a | yes |
| <a name="input_platform_id"></a> [platform\_id](#input\_platform\_id) | The type of virtual machine to create. | `string` | `"standard-v3"` | no |
| <a name="input_resources"></a> [resources](#input\_resources) | Resource configuration for the instances. | <pre>object({<br>    cores         = number<br>    memory        = number<br>    core_fraction = number<br>  })</pre> | <pre>{<br>  "core_fraction": 20,<br>  "cores": 2,<br>  "memory": 2<br>}</pre> | no |
| <a name="input_service_account_id"></a> [service\_account\_id](#input\_service\_account\_id) | The ID of the service account authorized for this instance group. | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The IDs of the subnets. | `list(string)` | n/a | yes |
| <a name="input_subnet_zones"></a> [subnet\_zones](#input\_subnet\_zones) | A list of availability zones | `list(string)` | n/a | yes |
| <a name="input_target_group_name"></a> [target\_group\_name](#input\_target\_group\_name) | The name of the target group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vm_ips"></a> [vm\_ips](#output\_vm\_ips) | Private and public ips of created machines |
