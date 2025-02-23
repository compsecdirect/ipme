<# 
            " CompSec Direct ipme"     
            
            Based on: PaulSec Send-Mail
            Author  :  compsecdirect.com
           
            Date    : 23-Feb-2025 
            File    : ipme.ps1 
            Purpose : Get Static Ip adress of the Internet, email when different
             
            Version : 3
#> 
    # purpose: check if the public ip for a host has changed. When it does, you get an email with the new ip, and the old ip is replaced.

    # setup; deploy on windows host and add to scheduled tasks. Set time between 1 day or 1 hour.

    # vars

    $smtpServer = "smtp.gmail.com" 
    $ip_file = "C:\Users\user\Documents\ip.txt"
    $old_ip_file ="C:\Users\user\Documents\ip-old.txt"

    Function mail_away {

    $source_email = "sender@gmail.com" 
    $dest_email = "dest@gmail.com" 
    $pass = "" 
    $SMTPServer = 'smtp.gmail.com'
    $SMTPPort = '587'
    $subject = "IP Change Reported: $env:computername"
    $data = "IP is now: $IP"
 
  
    $smtp = New-Object System.Net.Mail.SmtpClient($SMTPServer, $SMTPPort);
    $smtp.EnableSSL = $true
    $smtp.Credentials = New-Object System.Net.NetworkCredential($source_email, $pass);
    $smtp.Send($source_email, $dest_email, $subject, $data);
       
    }
    
    # Tested Feb 22, 2025
    $url = "https://whatismyip.akamai.com/"

    $HTML = Invoke-WebRequest -Uri $URl
    $IP= $html.Content
    $IP | Out-File $ip_file
    if (Test-Path $old_ip_file -PathType Leaf)
    {
        $OldIP = Get-Content $old_ip_file 
    }

    else
    {
        Write-Host "Looks like this is the first time running this script make sure the IP saved is correct."
        $IP | Out-File $old_ip_file
        exit
    }
    
    if ($Ip -ne $OldIP) {
    mail_away
    $IP | Out-File $old_ip_file
    }

    ### end of the script..... 
