# 0x17. Web stack debugging #3

![](https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/293/d42WuBh.png)

When debugging, sometimes logs are not enough. Either because the software is breaking in a way that was not expected and the error is not being logged, or because logs are not providing enough information. In this case, you will need to go down the stack, the good news is that this is something Holberton students can do :)

Wordpress is a very popular tool, it allows you to run blogs, portfolios, e-commerce and company websites… It actually powers 26% of the web, so there is a fair chance that you will end up working with it at some point in your career.

Wordpress is usually run on LAMP (Linux, Apache, MySQL, and PHP), which is a very widely used set of tools.

The web stack you are debugging today is a Wordpress website running on a LAMP stack.

## Requirements

### General

- All your files will be interpreted on Ubuntu 14.04 LTS
- All your files should end with a new line
- A README.md file at the root of the folder of the project is mandatory
- Your Puppet manifests must pass puppet-lint version 2.1.1 without any errors
- Your Puppet manifests must run without error
- Your Puppet manifests first line must be a comment explaining what the Puppet manifest is about
- Your Puppet manifests files must end with the extension .pp
- Files will be checked with Puppet v3.4

### More Info

- Install puppet-lint

```
$ apt-get install -y ruby
$ gem install puppet-lint -v 2.1.1
```


# TASK

0. Strace is your friend [0-strace_is_your_friend.pp](0-strace_is_your_friend.pp/)

Video: [Watch the Video Web Stack Debugging](https://www.youtube.com/watch?v=uHEzt1QuASo&feature=youtu.be)

Using strace, find out why Apache is returning a 500 error. Once you find the issue, fix it and then automate it using Puppet (instead of using Bash as you were previously doing).

Hint:

- strace can attach to a current running process
- You can use tmux to run strace in one window and curl in another one

Requirements:

- Your 0-strace_is_your_friend.pp file must contain Puppet code
- You can use whatever Puppet resource type you want for you fix

Example:

```
root@e514b399d69d:~# curl -sI 127.0.0.1
HTTP/1.0 500 Internal Server Error
Date: Fri, 24 Mar 2017 07:32:16 GMT
Server: Apache/2.4.7 (Ubuntu)
X-Powered-By: PHP/5.5.9-1ubuntu4.21
Connection: close
Content-Type: text/html

root@e514b399d69d:~# puppet apply 0-strace_is_your_friend.pp
Notice: Compiled catalog for e514b399d69d.ec2.internal in environment production in 0.02 seconds
Notice: /Stage[main]/Main/Exec[fix-wordpress]/returns: executed successfully
Notice: Finished catalog run in 0.08 seconds
root@e514b399d69d:~# curl -sI 127.0.0.1:80
root@e514b399d69d:~#
HTTP/1.1 200 OK
Date: Fri, 24 Mar 2017 07:11:52 GMT
Server: Apache/2.4.7 (Ubuntu)
X-Powered-By: PHP/5.5.9-1ubuntu4.21
Link: <http://127.0.0.1/?rest_route=/>; rel="https://api.w.org/"
Content-Type: text/html; charset=UTF-8

root@e514b399d69d:~# curl -s 127.0.0.1:80 | grep Holberton
<title>Holberton &#8211; Just another WordPress site</title>
<link rel="alternate" type="application/rss+xml" title="Holberton &raquo; Feed" href="http://127.0.0.1/?feed=rss2" />
<link rel="alternate" type="application/rss+xml" title="Holberton &raquo; Comments Feed" href="http://127.0.0.1/?feed=comments-rss2" />
        <div id="wp-custom-header" class="wp-custom-header"><img src="http://127.0.0.1/wp-content/themes/twentyseventeen/assets/images/header.jpg" width="2000" height="1200" alt="Holberton" /></div>  </div>
                            <h1 class="site-title"><a href="http://127.0.0.1/" rel="home">Holberton</a></h1>
        <p>Yet another bug by a Holberton student</p>
root@e514b399d69d:~#

```


1. Open the project container(it contains the Wordpress STACK LAMP[Linux-Apache-MyQSL-PHP])
2. Display the Process (ps command)
- We need to display all the process information with ASCII art process hierarchy. Processes with parent/child relation is listed as below.

```

root@b3d6dd0fde98:/# ps auxf                                                                                                                           
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND                                                                               
root       590  0.3  0.0  18176  3244 pts/0    Ss   12:16   0:00 /bin/bash                                                                             
root       608  0.0  0.0  15564  2120 pts/0    R+   12:18   0:00  \_ ps auxf                                                                           
root         1  0.2  0.0  17960  2836 ?        Ss   12:16   0:00 /bin/bash ./tmp                                                                       
root        13  0.0  0.1  61384  5288 ?        S    12:16   0:00 /usr/sbin/sshd                                                                        
root        62  0.0  0.0   4448  1624 ?        S    12:16   0:00 /bin/sh /usr/bi                                                                       
mysql      422  0.1  1.6 566460 66580 ?        Sl   12:16   0:00  \_ /usr/sbin/m                                                                       
root        74  0.0  0.5 276400 21436 ?        Ss   12:16   0:00 /usr/sbin/apach                                                                       
www-data    80  0.0  0.1 276424  7436 ?        S    12:16   0:00  \_ /usr/sbin/a                                                                       

```

It step is important because can display if we have an Apache service installed and running

Other ways is:

```
root@b3d6dd0fde98:/# service apache2 status                                                                                                            
 * apache2 is running                                                                                                                                  
root@b3d6dd0fde98:/#
```
[Good Info to manage the Apache on linux](https://www.haulmer.com/docs/guia-de-solucion-de-problemas-comunes-de-apache/)


3. test the connection with the server
- To know the server ip
```
root@b3d6dd0fde98:/# ifconfig                                                                      
eth0      Link encap:Ethernet  HWaddr 02:42:ac:11:00:12                                            
          inet addr:172.17.0.18  Bcast:172.17.255.255  Mask:255.255.0.0                            
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1                                       
          RX packets:69 errors:0 dropped:0 overruns:0 frame:0                                      
          TX packets:52 errors:0 dropped:0 overruns:0 carrier:0                                    
          collisions:0 txqueuelen:0                                                                
          RX bytes:9521 (9.5 KB)  TX bytes:7611 (7.6 KB)                                           
                                                                                                   
lo        Link encap:Local Loopback                                                                
          inet addr:127.0.0.1  Mask:255.0.0.0   

```

- test the Web Server connection

```
root@b3d6dd0fde98:/# curl -sI 172.17.0.18:80                                                       
HTTP/1.0 500 Internal Server Error                                                                 
Date: Tue, 19 May 2020 12:35:33 GMT                                                                
Server: Apache/2.4.7 (Ubuntu)                                                                      
X-Powered-By: PHP/5.5.9-1ubuntu4.21                                                                
Connection: close                                                                                  
Content-Type: text/html                                                                            
                                                                                                   
root@b3d6dd0fde98:/#



root@b3d6dd0fde98:/# curl -sI 127.0.0.1
HTTP/1.0 500 Internal Server Error
Date: Fri, 24 Mar 2017 07:32:16 GMT
Server: Apache/2.4.7 (Ubuntu)
X-Powered-By: PHP/5.5.9-1ubuntu4.21
Connection: close
Content-Type: text/html

root@b3d6dd0fde98:/#
```



4. use strace to attach to a current running process

strace is a powerful command line tool for debugging and trouble shooting programs in Unix-like operating systems such as Linux. It captures and records all system calls made by a process and the signals received by the process.

It displays the name of each system call together with its arguments enclosed in a parenthesis and its return value to standard error; you can optionally redirect it to a file as well.

[Good Info about strace](https://www.tecmint.com/strace-commands-for-troubleshooting-and-debugging-linux/)

test MySQL we have a error
```
root@b3d6dd0fde98:/# ps -auxf                                                                                                                    
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND                                                                         
root       590  0.0  0.0  18180  3240 pts/0    Ss   12:16   0:00 /bin/bash                                                                       
root       784  0.0  0.0  15564  2056 pts/0    R+   13:42   0:00  \_ ps -auxf                                                                    
root         1  0.0  0.0  17960  2624 ?        Ss   12:16   0:00 /bin/bash ./tmp/run.sh                                                          
root        13  0.0  0.0  61384  3852 ?        S    12:16   0:00 /usr/sbin/sshd -D                                                               
root       758  0.0  0.1  66016  5484 ?        Ss   13:41   0:00  \_ sshd: root@pts/1                                                            
root       760  0.0  0.0  19924  3580 pts/1    Ss+  13:41   0:00      \_ -bash                                                                   
root        62  0.0  0.0   4448  1360 ?        S    12:16   0:00 /bin/sh /usr/bin/mysqld_safe                                                    
mysql      422  0.0  1.5 566460 61696 ?        Sl   12:16   0:02  \_ /usr/sbin/mysqld --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/l
root        74  0.0  0.4 276400 16716 ?        Ss   12:16   0:00 /usr/sbin/apache2 -k start                                                      
www-data    80  0.0  0.3 278096 14416 ?        S    12:16   0:00  \_ /usr/sbin/apache2 -k start                                                  
www-data   618  0.0  0.3 276792 12496 ?        S    12:30   0:00  \_ /usr/sbin/apache2 -k start                                                  
root@b3d6dd0fde98:/# strace -p 422                                                                                                               
Process 422 attached                                                                                                                             
restart_syscall(<... resuming interrupted call ...>
```


5. [good info to Debugging WP](https://medium.com/@stefansilverio/debugging-php-in-a-lamp-stack-85b418a4eb1f)

- create file to fix the error: 0-strace_is_your_friend.pp
- test the file with standard of puppet
```
root@b3d6dd0fde98:/# puppet-lint 0-strace_is_your_friend.pp                                                                                                               
root@b3d6dd0fde98:/#
```
- apply the fix using puppet 
```
root@b3d6dd0fde98:/# puppet apply 0-strace_is_your_friend.pp                                                                                                              
Notice: Compiled catalog for b3d6dd0fde98.ec2.internal in environment production in 0.03 seconds                                                       
Notice: /Stage[main]/Main/Exec[type fixer ftw]/returns: executed successfully                                                                          
Notice: Finished catalog run in 0.05 seconds    
```

6 - Test the Server Status
```
root@b3d6dd0fde98:/# curl -sI 127.0.0.1                                                                                                                
HTTP/1.1 200 OK                                                                                                                                        
Date: Tue, 19 May 2020 13:57:39 GMT                                                                                                                    
Server: Apache/2.4.7 (Ubuntu)                                                                                                                          
X-Powered-By: PHP/5.5.9-1ubuntu4.21                                                                                                                    
Link: <http://127.0.0.1/?rest_route=/>; rel="https://api.w.org/"                                                                                       
Content-Type: text/html; charset=UTF-8  

```  

