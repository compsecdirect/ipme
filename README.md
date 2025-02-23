# ipme
Powershell script checks when public ip changes, emails someone

## Config

Change emails, locations, pass, etc.

## First Run

1. Does Invoke Web reques to pull your public ip. It writes the output to a file called ip-old.txt.
2. This file, and the same process, is compared against in subsequent executions.
3. When different, an email is sent to a recipient. This script uses gmail to send that email.
4. After the email is sent, the ip-old.txt is updated with ip.txt

