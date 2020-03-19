# 0x03. Shell, init files, variables and expansions


## Requirements

### General

- Allowed editors: vi, vim, emacs
- All your scripts will be tested on Ubuntu 14.04 LTS
- All your scripts should be exactly two lines long ($ wc -l file should print 2)
- All your files should end with a new line (why?)
- The first line of all your files should be exactly #!/bin/bash
- A README.md file, at the root of the folder of the project, describing what each script is doing
- You are not allowed to use &&, || or ;
- You are not allowed to use bc, sed or awk
- All your files must be executable


# Tasks

0. <o> mandatory [0-alias](0-alias/)

Create a script that creates an alias.

- Name: ls
- Value: rm *
```
julien@ubuntu:/tmp/0x03$ ls
0-alias  file1  file2
julien@ubuntu:/tmp/0x03$ source ./0-alias 
julien@ubuntu:/tmp/0x03$ ls
julien@ubuntu:/tmp/0x03$ \ls
julien@ubuntu:/tmp/0x03$ 
```