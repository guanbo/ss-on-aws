# SS on AWS

## Quick Start

```shell
$ ./spot.sh ap-northeast-1
$ aws ec2 describe-spot-instance-requests --region ap-northeast-1
## wait for spot done and find out ip_address
$ ./install.sh 1.2.3.4
```