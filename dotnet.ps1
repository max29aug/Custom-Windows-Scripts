#installing Ring Central Desktop App
New-Item -ItemType Directory -Path 'C:\Downloads' -Force
$folder = "c:\Downloads"
$url= "https://download.microsoft.com/download/6/A/A/6AA4EDFF-645B-48C5-81CC-ED5963AEAD48/vc_redist.x86.exe"
$req = [System.Net.HttpWebRequest]::Create($url)
$req.Method = "HEAD"
$response = $req.GetResponse()
$fUri = $response.ResponseUri
$filename = [System.IO.Path]::GetFileName($fUri.LocalPath); 
$response.Close()
$target = join-path $folder $filename 
Invoke-WebRequest -Uri $url -OutFile $target 



(Start-Process -FilePath $target -ArgumentList "/install /quiet /norestart" -Wait -PassThru).ExitCode