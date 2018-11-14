ConvertKit Challenge
============

| Candidate | Role |
|---|---|
| Lucas do Amaral Saboya | Infrastructure Engineer |


#Project Build Variables


##### Basion Module
| Variable | Description | default |
|---|---|---|
| `instance_type` | EC2 instance type | `t2.nano` |
| `hostname` | Hostname to override the bastion host's cloud-config | `Nill` |
| `name_prefix` | Prefix the ASG will append to the ec2 instances it spins up | `bastion-` |
| `asg_max_size` | Maximum number of instances this ASG will spin up | `1` |
| `asg_min_size` | Minimum number of instances this ASG will spin up | `1` |
| `asg_desired_capacity` | Desired number of instances this ASG will spin up | `1` |
| `health_check_grace_period` | Amount of time (in seconds) to wait before start pooling for the instance's health | `3600` |
| `health_check_type` | Type of ASG health check to use | `ELB` |
| `force_delete` | Wether or not to allow deleting the autoscaling group without waiting for all instances in the pool to terminate. | `true` |
| `authorized_keys` | Public SSH keys to inject into the node | `Nill` |


##### EC2 Module
| Variable | Description | default |
|---|---|---|
| `instance_type` | EC2 instance type | `t2.nano` |
| `hostname` | Hostname to override the bastion host's cloud-config | `Nill` |
| `tags` | Tags list of tags to append to this ASG and it's instances | `Nill` |
| `name_prefix` | Prefix the ASG will append to the ec2 instances it spins up | `bastion-` |
| `asg_max_size` | Maximum number of instances this ASG will spin up | `1` |
| `asg_min_size` | Minimum number of instances this ASG will spin up | `1` |
| `asg_desired_capacity` | Desired number of instances this ASG will spin up | `1` |
| `health_check_grace_period` | Amount of time (in seconds) to wait before start pooling for the instance's health | `3600` |
| `health_check_type` | Type of ASG health check to use | `ELB` |
| `force_delete` | Wether or not to allow deleting the autoscaling group without waiting for all instances in the pool to terminate. | `true` |
| `authorized_keys` | Public SSH keys to inject into the node | `Nill` |
| `authorized_keys` | Public SSH keys to inject into the node | `Nill` |
| `db_password` | RDS password to inject on the container (this same variable will be used on the RDS module) | `redacted` |
| `db_username` | RDS password to inject on the container (this same variable will be used on the RDS module) | `convertkit` |
| `db_name` | RDS database name to inject on the container (this same variable will be used on the RDS module) | `convertkit` |
| `docker_tag` | Docker tag to use | `Nill` |
| `secret_key_name` | Rails' `secrect_key_base ` to inject on the container | `redacted` |

##### ELB Module
| Variable | Description | default |
|---|---|---|
| `name` | ELB name to append | `convertkit` |
| `instance_port` | EC2 instance port for the ELB to forward traffic to | `3000` |
| `instance_port` | EC2 instance protocol for the ELB to forward traffic to use | `Nill` |
| `lb_port` | TCP port for the ELB to listen on | `443` |
| `lb_protocol` | Protocol for the ELB to listen on | `Nill` |
| `hc_healty_threshold` | Number of successful checks in order to deem an instances healty | 2 |
| `hc_unhealthy_threshold` | Number of successful checks in order to deem an instances unhealty | 4 |
| `hc_timeout` | Time (in seconds) to wait for a health check probe to complete | 3 |
| `hc_target` | Health check endpoint | HTTP:3000/ |
| `hc_interval` | Frequency between probes | 5 |
| `cross_zone_lb` | Wether or not to load balance across Availability Zones | true |
| `idle_timeout` | The time in seconds that the connection is allowed to be idle | 400 |
| `connection_draining` | Boolean to enable connection draining | true |
| `connection_draining_timeout` | The time (in seconds) to allow for connections to drain | 400 |



##### RDS Module
| Variable | Description | default |
|---|---|---|
| `disk_size` | EBS disk size to use on the instance | `10` |
| `engine` | DB engine to use | `mysql` |
| `engine_version` | DB engine version to use | `8.0.11` |
| `instance_type` | DB instance size to use | `db.t2.micro` |
| `multi_az` | Wether or not to spin a multi-az DB instance |  `true` |
| `skip_final_snapshot` | Wether or not you want to create a snapshot of the instance before terminanting it | `true` |
| `final_snapshot_identifier` | Snapshot name to use | backup |
| `db_username` | DB instance username to use | `Nill` |
| `db_password` | DB instance password to use | `Nill` |
| `tags` | Tags list of tags to append to this DB instance | `Nill` |

##### VPC Module
| Variable | Description | default |
|---|---|---|
| `az_count` | Number of Availability zones to span your subnetworks on | `3` |
| `vpc_cidr_block` | CIDR block to use in this VPC | `10.0.0.0/16` |
| `tags` | Tags list of tags to append to this VPC | `Nill` |

