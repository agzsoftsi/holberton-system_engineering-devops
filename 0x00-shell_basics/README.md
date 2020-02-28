# 0x00. Shell, basics

## Requirements

### General

- Allowed editors: vi, vim, emacs
- All your scripts will be tested on Ubuntu 14.04 LTS
- All your scripts should be exactly two lines long ($ wc -l file should print 2)
- All your files should end with a new line (why?)
- The first line of all your files should be exactly #!/bin/bash
- A README.md file at the root of the holberton-system_engineering-devops repo, containing a description of the repository
- A README.md file, at the root of the folder of this project, describing what each script is doing
- You are not allowed to use backticks, &&, || or ;
- All your scripts must be executable. Use this command: chmod u+x file. We will see later what it means.


### More Info

Example of line count and first line
```
julien@ubuntu:/tmp$ wc -l 12-file_type 
2 12-file_type
julien@ubuntu:/tmp$ head -n 1 12-file_type 
#!/bin/bash
julien@ubuntu:/tmp$ 
```

In order to test your scripts, you will need to use this command: chmod u+x file. We will see later what does chmod mean and do, but you can have a look at man chmod if you are curious.

Example
```
julien@ubuntu:/tmp$ ls
12-file_type
lll
julien@ubuntu:/tmp$ ls -la lll
-rw-rw-r-- 1 julien julien 15 Sep 19 21:05 lll
julien@ubuntu:/tmp$ cat lll
#!/bin/bash
ls
julien@ubuntu:/tmp$ ls -l lll
-rw-rw-r-- 1 julien julien 15 Sep 19 21:05 lll
julien@ubuntu:/tmp$ chmod u+x lll # you do not have to understand this yet
julien@ubuntu:/tmp$ ls -l lll
-rwxrw-r-- 1 julien julien 15 Sep 19 21:05 lll
julien@ubuntu:/tmp$ ./lll
12-file_type
lll
julien@ubuntu:/tmp$ 
```

# TASKs

0. Where am I? mandatory

File: [0-current_working_directory](0-current_working_directory/)

Write a script that prints the absolute path name of the current working directory.

Example:
```
$ ./0-current_working_directory
/Users/holbertonschool/holbertonschool-sysadmin_devops/0x00-shell_basics
$
```

1. What’s in there? mandatory

File: [1-listit](1-listit/)

Display the contents list of your current directory.

Example:
```
$ ./1-listit
Applications    Documents   Dropbox Movies Pictures
Desktop Downloads   Library Music Public
$
```

2. There is no place like home mandatory

File: [2-bring_me_home](2-bring_me_home/)

Write a script that changes the working directory to the user’s home directory.

- You are not allowed to use any shell variables
```
julien@ubuntu:/tmp$ pwd
/tmp
julien@ubuntu:/tmp$ echo $HOME
/home/julien
julien@ubuntu:/tmp$ source ./2-bring_me_home
julien@ubuntu:~$ pwd
/home/julien
julien@ubuntu:~$ 
```

3. The long format

File: [3-listfiles](3-listfiles/)

Display current directory contents in a long format

Example:
```
$ ./3-listfiles
total 32
-rwxr-xr-x@ 1 sylvain staff 18 Jan 25 00:19 0-current_working_directory
-rwxr-xr-x@ 1 sylvain staff 19 Jan 25 00:23 1-listit
-rwxr-xr-x@ 1 sylvain staff 18 Jan 25 00:29 2-bring_me_home
-rwxr-xr-x@ 1 sylvain staff 18 Jan 25 00:39 3-listfiles
$
```

4. Hidden files mandatory

File: [4-listmorefiles](4-listmorefiles/)

Display current directory contents, including hidden files (starting with .). Use the long format.

Example:
```
$ ./4-listmorefiles
total 32
drwxr-xr-x@ 6 sylvain staff 204 Jan 25 00:29 .
drwxr-xr-x@ 43 sylvain staff 1462 Jan 25 00:19 ..
-rwxr-xr-x@ 1 sylvain staff 18 Jan 25 00:19 0-current_working_directory
-rwxr-xr-x@ 1 sylvain staff 19 Jan 25 00:23 1-listit
-rwxr-xr-x@ 1 sylvain staff 18 Jan 25 00:29 2-bring_me_home
-rwxr-xr-x@ 1 sylvain staff 18 Jan 25 00:39 3-listfiles
-rwxr-xr-x@ 1 sylvain staff 18 Jan 25 00:41 4-listmorefiles
$
```

5. I love numbers mandatory

File: [5-listfilesdigitonly](5-listfilesdigitonly/)

Display current directory contents.

- Long format
- with user and group IDs displayed numerically
- And hidden files (starting with .)

Example:
```
$ ./5-listfilesdigitonly
total 32
drwxr-xr-x@ 6 501 20 204 Jan 25 00:29 .
drwxr-xr-x@ 43 501 20 1462 Jan 25 00:19 ..
-rwxr-xr-x@ 1 501 20 18 Jan 25 00:19 0-current_working_directory
-rwxr-xr-x@ 1 501 20 18 Jan 25 00:23 1-listfiles
-rwxr-xr-x@ 1 501 20 19 Jan 25 00:29 2-bring_me_home
-rwxr-xr-x@ 1 501 20 20 Jan 25 00:39 3-listfiles
-rwxr-xr-x@ 1 501 20 18 Jan 25 00:41 4-listmorefiles
-rwxr-xr-x@ 1 501 20 18 Jan 25 00:43 5-listfilesdigitonly
$
```


6. Welcome Holberton mandatory

File: [6-firstdirectory](6-firstdirectory/)

Create a script that creates a directory named holberton in the /tmp/ directory.

Example:
```
$ ./6-firstdirectory
$ file /tmp/holberton/
/tmp/holberton/: directory
$
```
