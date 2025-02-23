# ipme
Powershell script checks when public ip changes, emails someone

## Config

Change emails, locations, pass, etc.

## Email Setup

Need to use gmail application passwords (2025)

![image](https://github.com/user-attachments/assets/fb5130b5-e915-487c-9309-a90963aa38ae)

1. Make an application password, call it something useful in relation to where you use the password.  
2. Save the password  
   ![image](https://github.com/user-attachments/assets/a378879a-db4a-4375-9730-62bb8f87940a)
3. Edit the script  



## First Run

1. Does Invoke Web reques to pull your public ip. It writes the output to a file called ip-old.txt.
2. This file, and the same process, is compared against in subsequent executions.
3. When different, an email is sent to a recipient. This script uses gmail to send that email.
4. After the email is sent, the ip-old.txt is updated with ip.txt

## Scheduled run
Make a scheduled task, either daily or hourly, based on your needs.  
![image](https://github.com/user-attachments/assets/dc0f880a-a086-47d4-9bf6-1c773edb2717)  
If you know the device is tied to power and network, the trigger can be on start up.
