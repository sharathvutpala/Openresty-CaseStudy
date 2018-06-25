# Openresty-CaseStudy

## Setting up the environment
* Created an AWS Free Tier Account
* Used Ubuntu Operating System as I am comfortable with deb packaging
* Installed terraform in my local machine
* Installed awscli 
* Configured the aws credentials for launching the EC2 instance

```
$ aws configure

```

### Clone this repo in your local machine

```
git clone https://github.com/madhuchary/openresty-task.git
```

### Create security group

```
bash sg-rules.sh
```

### Launching EC2 Instance.

```
pip install boto3
```
* Launching AWS EC2 Instance using boto3 (AWS SDK for Python)
```
ptyhon ec2-launch.py
```

### SSH to the launched instance 

ssh -i <aws-ssh-keys> ubuntu@<public-ip>

```
chmod 400 aws-keys
ssh -i aws-keys.pem ubuntu@54.186.177.39
```

### Clone git repo to your AWS instance

```
git clone https://github.com/madhuchary/openresty-task.git
```

## CD to the cloned directory and execute the below commands 

### Install Docker CE 

```
cd openresty-task
bash install-docker.sh
```

### Build openresty debian package

```
bash build_openresty_deb_pkg.sh
```

### Build docker image 

```
cd docker 
docker build -t openresty .
```

### Starting the container

```
cd ..
ansible-playbook openresty-cnt-start.yml
```

### Stopping the container

```
ansible-playbook openresty-cnt-stop.yml
```

### Installing nagios and monitoring openresty

### Change email address under roles/nagios-install/files/contacts_nagios2.cfg
```
ansible-playbook nagios.yml
```

### Testing the monitoring 
### Stop openresty container and wait for sometime and you should receive an email (Please check spam as well)

```
ansible-playbook openresty-cnt-stop.yml
```
