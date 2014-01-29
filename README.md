# vagrant-box

Goal is to create multipurpose vagrant box, using puppet and hiera

# Boxes definitions
NOTE currently all boxes are made for VMware 

Done boxes are described below.

## Database

Hostname is ```database```

```
vagrant up database
```

Lifts up database box on designated IP (192.168.3.2), if you want to change it, set 

	ip = "10.6.0.1"

to something else.

Installs following:
* MySQL 5.5.35
	* Port ```3306```
	* Socket ```/var/run/mysqld/mysqld.sock```

