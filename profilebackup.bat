set MDT=PDC
mkdir \\%MDT%\UserData\Data\%username%
hostname > \\%MDT%\UserData\Data\%username%\PCName.txt
echo %time% >> \\%MDT%\UserData\Data\%username%\PCName.txt
robocopy "%userprofile%\Documents" "\\%MDT%\UserData\Data\%username%\Documents" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /X /XF "thumbs.db" /XD "My Music" "My Videos" "My Pictures"
robocopy "%userprofile%\Desktop" "\\%MDT%\UserData\Data\%username%\Desktop" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /XF "thumbs.db" /XD "IEcompatcache"
robocopy "%userprofile%\Favorites" "\\%MDT%\UserData\Data\%username%\Favorites" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /XF "thumbs.db" /XD "IEcompatcache"
robocopy "%userprofile%\AppData\Roaming\Microsoft\Signatures" "\\%MDT%\UserData\Data\%username%\Signatures" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /XF "thumbs.db" /XD "IEcompatcache"
robocopy "%userprofile%\AppData\Local\Google\Chrome\User Data\Default" "\\%MDT%\UserData\Data\%username%\ChromeFavs" Bookmarks /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /XF "thumbs.db" /XD "IEcompatcache"
robocopy "%userprofile%\AppData\Roaming\Microsoft\Templates" "\\%MDT%\UserData\Data\%username%\Templates" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V
robocopy "%userprofile%\Music" "\\%MDT%\UserData\Data\%username%\My Music" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /X /XF "thumbs.db"  
robocopy "%userprofile%\Videos" "\\%MDT%\UserData\Data\%username%\My Videos" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /X /XF "thumbs.db"  
robocopy "%userprofile%\Pictures" "\\%MDT%\UserData\Data\%username%\My Pictures" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /X /XF "thumbs.db"  
robocopy "%userprofile%\AppData\Local\Microsoft\Outlook" "\\%MDT%\UserData\Data\%username%\AppData\Local\Microsoft\Outlook" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /X /XF *.*ost* *.xml *.oab *.dat *.inf *.nst
robocopy "%userprofile%\AppData\Roaming\Microsoft\Excel\XLSTART" "\\%MDT%\UserData\Data\%username%\XLSTART" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /XF "thumbs.db" /XD "IEcompatcache"
robocopy "%userprofile%\Downloads" "\\%MDT%\UserData\Data\%username%\Downloads" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /X /XF "thumbs.db"  
robocopy "%userprofile%\AppData\Roaming\Microsoft\Sticky Notes" "\\%MDT%\UserData\Data\%username%\StickyNotes" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /X



robocopy "%userprofile%\AppData\Local\Microsoft\Feeds" "\\%MDT%\UserData\Data\%username%\Feeds" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /XF "thumbs.db" /XD "IEcompatcache"

C:
cd %userprofile%
FOR /F "tokens=3 skip=2"  %%G IN ('dir places.sqlite /s') DO @IF EXIST %%G SET Source=%%G
robocopy %Source% "\\%MDT%\UserData\Data\%username%\FireFox" places.sqlite

REM **************** Copy Excel adn Word Recent Documents from Registry ****************************************************
reg export "HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Excel\File MRU" \\%MDT%\UserData\Data\%username%\ExcelFiles.txt
reg export "HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Word\File MRU" \\%MDT%\UserData\Data\%username%\WordFiles.txt
for /F "skip=4 tokens=2 delims=*" %%a in ('type \\%MDT%\UserData\Data\%username%\ExcelFiles.txt') do echo %%a >> \\%MDT%\UserData\Data\%username%\RecentExcelFiles.txt
del \\%MDT%\UserData\Data\%username%\ExcelFiles.txt
for /F "skip=4 tokens=2 delims=*" %%a in ('type \\%MDT%\UserData\Data\%username%\WordFiles.txt') do echo %%a >> \\%MDT%\UserData\Data\%username%\RecentWordFiles.txt
del \\%MDT%\UserData\Data\%username%\WordFiles.txt


REM Get installed printers and Default Printer
wmic printer get name,Drivername,portname,default > \\%MDT%\UserData\Data\%username%\Printers.txt

REM List local and network drives
wmic logicaldisk get caption,description,drivetype,providername,volumename > \\%MDT%\UserData\Data\%username%\Drives.txt

REM List of installed programs
wmic product get name,version > \\%MDT%\UserData\Data\%username%\Apps.txt

REM create an HTML file with GPO Results
gpresult /F /h \\%MDT%\UserData\Data\%username%\GPOresult.html
echo %time% >> \\%MDT%\UserData\Data\%username%\PCName.txt
