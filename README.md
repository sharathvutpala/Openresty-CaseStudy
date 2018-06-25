# Openresty-CaseStudy

## Setting up the environment
* Created an AWS Free Tier Account
* Used Ubuntu Operating System as I am comfortable with deb packaging
* Installed terraform in my local machine
* Installed awscli 
* Configured the aws credentials for launching the EC2 instance
* Created a keypair "openresty" to connect to the EC2 Instance

```
$ aws configure

```

### Provisioning EC2 Instance
* I used Terraform for provisioning EC2 instance
* Docker and Ansible are installed in the EC2 instance during the launh with the help of terraform userdata 
* For launching the instance we need to change to the terraform directory in the repo and need to initialize the process

```
terraform init
```
* Once the initialization is done we can check the configuration plan using 
``` 
terraform plan 
```  
* If everything is correct we can provision the instance and the other resources that are configured in the template
```
terraform apply
```

### SSH to the launched instance 
```
ssh -i <aws-ssh-keys> ubuntu@<public-ip>

```
chmod 400 openresty.pem
ssh -i aws-keys.pem ubuntu@13.232.80.237
```

### Cloned this git repo to the AWS instance

```
https://github.com/sharathvutpala/Openresty-CaseStudy.git
```


### Building openresty debian package

```
bash build_openresty_deb_pkg.sh
```

### Building docker image 

```
cd docker 
docker build -t openresty .
```

### Starting the container

```
cd ..
ansible-playbook openresty-start.yml
```

### Stopping the container

```
ansible-playbook openresty-stop.yml
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
