# SS on AWS

## Quick Start

```shell
$ ./spot.sh ap-northeast-1
$ aws ec2 describe-spot-instance-requests --region ap-northeast-1
## wait for spot done and find out ip_address
$ ./install.sh 1.2.3.4
```

## Cleanup

```shell
$ aws ec2 cancel-spot-fleet-requests --terminate-instances --spot-fleet-request-ids sfr-663782c8-0ccf-4b8e-b75f-b69f97ce5d69  --region ap-northeast-1
```