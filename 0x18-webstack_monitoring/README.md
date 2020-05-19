# 0x18. Webstack monitoring

![](https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/281/hb3pAsO.png)

## Background Context

"You cannot fix or improve what you cannot measure" is a famous saying in the Tech industry. In the age of the data-ism, monitoring how our Software systems are doing is an important thing. In this project, we will implement one of many tools to measure what is going on our servers.

Web stack monitoring can be broken down into 2 categories:

- Application monitoring: getting data about your running software and making sure it is behaving as expected
- Server monitoring: getting data about your virtual or physical server and making sure they are not overloaded (could be CPU, memory, disk or network overload)

## Requirements

### General

- Allowed editors: vi, vim, emacs
- All your files will be interpreted on Ubuntu 16.04 LTS
- All your files should end with a new line
- A README.md file, at the root of the folder of the project, is mandatory
- All your Bash script files must be executable
- Your Bash script must pass Shellcheck (version 0.3.7) without any error
- The first line of all your Bash scripts should be exactly #!/usr/bin/env bash
- The second line of all your Bash scripts should be a comment explaining what is the script doing


# TASKS

0. Sign up for Datadog and install datadog-agent mandatory

For this task head to https://www.datadoghq.com/ and sign up for a free Datadog account. When signing up, you’ll have the option of selecting statistics from your current stack that Datadog can monitor for you. Once you have an account set up, follow the instructions given on the website to install the Datadog agent.
![](amazonaws.com/uploads/medias/2019/6/6b0ea6345a6375437845.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARDDGGGOUWMNL5ANN%2F20200519%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20200519T142017Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=a737ddba37075a3464580168a957861f5f8345b70afa1f0900f7b18592dc1238)

- Sign up for Datadog
- Install datadog-agent on web-01
- Create an application key
- Copy-paste in your Intranet user profile (here) your DataDog API key and your DataDog application key.


1. Monitor some metrics mandatory

Among the litany of data your monitoring service can report to you are system metrics. You can use these metrics to determine statistics such as reads/writes per second, which can help your company determine if/how they should scale. Set up some monitors within the Datadog dashboard to monitor and alert you of a few. You can read about the various system metrics that you can monitor here: System Check.

![](https://holbertonintranet.s3.amazonaws.com/uploads/medias/2019/6/6a4551974aadc181e97a.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARDDGGGOUWMNL5ANN%2F20200519%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20200519T142017Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=3896b7684d1e6e9adf62a7278392fc169edb7947440a82ca7e6c5abf81ca6c7f)

- Set up a monitor that checks the number of read requests issued to the device per second.
- Set up a monitor that checks the number of write requests issued to the device per second.


2. Create a dashboard mandatory - [2-setup_datadog](2-setup_datadog/)

Now create a dashboard with different metrics displayed in order to get a few different visualizations.

- Create a new dashboard
- Add at least 4 widgets to your dashboard. They can be of any type and monitor whatever you’d like
- Create the answer file 2-setup_datadog which has the dashboard_id on the first line. Note: in order to get the id of your dashboard, you may need to use Datadog’s API

