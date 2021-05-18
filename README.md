# SS on AWS


## Prerequest

### AWSCLI

download form [https://awscli.amazonaws.com/AWSCLIV2.pkg](https://awscli.amazonaws.com/AWSCLIV2.pkg) and install

### AWS Access Token

Browse [https://console.aws.amazon.com/iam/home#/users](https://console.aws.amazon.com/iam/home#/users)

- select user, such as (administrator)
- select security_credentials
- click `create access token` button
- downlaod `administrator_accessKeys.csv`

`administrator_accessKeys.csv` look likes following:  

|Access key ID|	Secret access key|
|-|-|
|AKIAZWMQDV7BFADM2JPM|	b/3TOls1g/hNyrBd8HcLGXSfqvvtJ+40cRbA+aKr|

```shell
$ aws configure
AWS Access Key ID [****************QFHX]: 
AWS Secret Access Key [****************+riJ]: 
Default region name [ap-northeast-1]: 
Default output format [json]:
```

### Security Group

```shell
$ aws ec2 create-security-group --group-name ss --description shadowsocks
$ aws ec2 authorize-security-group-ingress --group-name ss --protocol tcp --port 22 --cidr 0.0.0.0/0
$ aws ec2 authorize-security-group-ingress --group-name ss --protocol tcp --port 20201 --cidr 0.0.0.0/0
```

## Quick Start

```shell
$ ./spot.sh ap-northeast-1
$ aws ec2 describe-spot-instance-requests --region ap-northeast-1
## wait for spot done and find out ip_address, for example: 1.2.3.4
$ ./install.sh 1.2.3.4
```

## Cleanup

```shell
$ aws ec2 cancel-spot-fleet-requests --terminate-instances --spot-fleet-request-ids sfr-663782c8-0ccf-4b8e-b75f-b69f97ce5d69  --region ap-northeast-1
```

## Service Control

### Startup
```shell
$ avpn './startup.sh'
```

### Shutdown
```shell
$ avpn './shutdown.sh'
```

## Authorize IP to Security Group

browse http://your.host.ip:20201/auth