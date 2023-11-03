#installing Ring Central Desktop App
New-Item -ItemType Directory -Path 'C:\Downloads' -Force
$folder = "c:\Downloads"
$url= "https://cdn.watchguard.com/SoftwareCenter/Files/MUVPN_SSL/12_7/WG-MVPN-SSL_12_7.exe"
$req = [System.Net.HttpWebRequest]::Create($url)
$req.Method = "HEAD"
$response = $req.GetResponse()
$fUri = $response.ResponseUri
$filename = [System.IO.Path]::GetFileName($fUri.LocalPath); 
$response.Close()
$target = join-path $folder $filename 
Invoke-WebRequest -Uri $url -OutFile $target 



(Start-Process -FilePath $target -ArgumentList "/install /quiet /norestart" -Wait -PassThru).ExitCode