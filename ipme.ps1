<# 
            " CompSec Direct ipme"     
            
            Based on: PaulSec Send-Mail
            Author  :  compsecdirect.com
           
            Date    : 13-July-2018 
            File    : ipme.ps1 
            Purpose : Get Static Ip adress of the Internet, email when different
             
            Version : 1 
#> 

    $url = "https://www.canihazip.com/s"
    $HTML = Invoke-WebRequest -Uri $URl
    $IP= $html.Content
    $IP | Out-File "C:\Users\name\Documents\ip.txt"
    $OldIP = Get-Content "C:\Users\name\Documents\ip-old.txt" 
    $smtpServer = "smtp.gmail.com" 

    Function mail_away {

    $email = "source@gmail.com" 
    $email2 = "dest@gmail.com" 
    $pass = "pass" 
    $SMTPServer = 'smtp.gmail.com'
    $SMTPPort = '587'
    $subject = 'IP Change Reported'
    $data = "IP is now: $Ip"
 
  
    $smtp = New-Object System.Net.Mail.SmtpClient($SMTPServer, $SMTPPort);
    $smtp.EnableSSL = $true
    $smtp.Credentials = New-Object System.Net.NetworkCredential($email, $pass);
    $smtp.Send($email, $email2, $subject, $data);
    $IP | Out-File "C:\Users\name\Documents\ip-old.txt"
   
    } 

    if ($Ip -ne $OldIP) {mail_away}

    ### end of the script..... 
