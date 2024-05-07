set MDT=PDC
REM hostname > %userprofile%\Desktop\PCName.txt
REM echo %time% >> %userprofile%\Desktop\PCName.txt
robocopy "\\%MDT%\UserData\Data\%username%\Documents" "%userprofile%\Documents" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /X /XF "thumbs.db" /XD "IEcompatcache"
robocopy "\\%MDT%\UserData\Data\%username%\Desktop" "%userprofile%\Desktop" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /XF "thumbs.db" /XD "IEcompatcache"
robocopy "\\%MDT%\UserData\Data\%username%\Favorites" "%userprofile%\Favorites" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /XF "thumbs.db" /XD "IEcompatcache"
robocopy "\\%MDT%\UserData\Data\%username%\Signatures" "%userprofile%\AppData\Roaming\Microsoft\Signatures" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /XF "thumbs.db" /XD "IEcompatcache"
robocopy "\\%MDT%\UserData\Data\%username%\ChromeFavs" "%userprofile%\AppData\Local\Google\Chrome\User Data\Default" Bookmarks /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /XF "thumbs.db" /XD "IEcompatcache"
robocopy "\\%MDT%\UserData\Data\%username%\Templates" "%userprofile%\AppData\Roaming\Microsoft\Templates" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V
robocopy "\\%MDT%\UserData\Data\%username%\My Music" "%userprofile%\Music" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /X /XF "thumbs.db"  
robocopy "\\%MDT%\UserData\Data\%username%\My Videos" "%userprofile%\Videos" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /X /XF "thumbs.db"  
robocopy "\\%MDT%\UserData\Data\%username%\My Pictures" "%userprofile%\Pictures" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /X /XF "thumbs.db"  
robocopy "\\%MDT%\UserData\Data\%username%\AppData\Local\Microsoft\Outlook" "%userprofile%\AppData\Local\Microsoft\Outlook" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /X /XF "thumbs.db" /XD "IEcompatcache"
robocopy "\\%MDT%\UserData\Data\%username%\XLSTART" "%userprofile%\AppData\Roaming\Microsoft\Excel\XLSTART" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /XF "thumbs.db" /XD "IEcompatcache"
robocopy "\\%MDT%\UserData\Data\%username%\Downloads" "%userprofile%\Downloads" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /X /XF "thumbs.db"  
robocopy "\\%MDT%\UserData\Data\%username%\StickyNotes" "%userprofile%\AppData\Roaming\Microsoft\Sticky Notes" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /X
robocopy "\\%MDT%\UserData\Data\%username%\FireFox" "%userprofile%\Documents\FireFoxFavs" places.sqlite 

robocopy "\\%MDT%\UserData\Data\%username%\Feeds" "%userprofile%\AppData\Local\Microsoft\Feeds" /MIR /XX /IPG:5 /COPY:DT /W:5 /R:2 /V /XF "thumbs.db" /XD "IEcompatcache"

REM ****************** Write file with Recent Excel and Word Documents *********************************
type \\%MDT%\UserData\Data\%username%\RecentExcelFiles.txt > %userprofile%\Documents\ExcelRecentFiles.txt
type \\%MDT%\UserData\Data\%username%\RecentWordFiles.txt > %userprofile%\Documents\WordRecentFiles.txt
