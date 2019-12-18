
if (-not (test-path "$env:ProgramFiles\7-Zip\7z.exe")) 
{throw "$env:ProgramFiles\7-Zip\7z.exe needed"}
set-alias 7z "$env:ProgramFiles\7-Zip\7z.exe"

 ##New-Item -Path "$outDir" -Name "logfiles_backup" -ItemType "directory"
$outDir = "D:\BPS\DMS\Logs\"
$inDir = "D:\BPS\DMS\Logs\"
$bkpDir = "$outDir\logfiles_backup"
$Month = Get-Date -Format "MM"
 
#7z a -mx5 
#D:\BPS\DMS\Logs\aaa.zip D:\BPS\DMS\Logs\DMSweb_2019-02-01_01.log
#"DMSweb_2019-02-01_00.log" -match "DMSweb_\d{4}-\d{2}-\d{2}_\d{2}.log"
#$string = "DMSweb_2019-02-01_00.log"
#$a = $string.split('-')[1]
#echo $a


$FileNames = (Get-ChildItem -Path $inDir\*.log ).Name
#$ext = (Get-ChildItem D:\BPS\DMS\Logs\).Extension
 foreach($FileName in $FileNames)
 
 {
 $a = $FileName.split('-')[1]
 #echo $a
 $diff = $Month - $a
 if($diff -gt 0 )
 {
 
 #echo "yes"
 7z u -t7z $outDir\$a.zip $inDir\$Filename 
 }
 else 
 {
 echo "No"
 }
 }
 
 Move-Item -Path $outDir\*.log -Destination $outDir\logfiles_backup\ -force


 $zipFilenames = (Get-ChildItem -Path $inDir\*.zip ).Name
 foreach($zipFilename in $zipFilenames)
 {
 switch($zipFilename)
 {
    01.zip { $a = "Jan";Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName  "$a.zip";break} 

    02.zip { $a = "Feb"; Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName "$a.zip";break}

    03.zip { $a = "Mar"; Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName  "$a.zip";break}

    04.zip { $a = "Apr"; Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName  "$a.zip";break}

    05.zip { $a = "May"; Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName  "$a.zip";break}

    06.zip { $a = "Jun"; Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName  "$a.zip";break}

    07.zip { $a = "Jul"; Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName  "$a.zip";break}

    08.zip { $a = "Aug"; Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName  "$a.zip";break}

    09.zip { $a = "Sep"; Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName  "$a.zip";break}

    10.zip { $a = "Oct"; Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName  "$a.zip";break}

    11.zip { $a = "Nov"; Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName  "$a.zip";break}

    12.zip { $a = "Dec"; Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName  "$a.zip";break}
 }
 Start-Sleep -Seconds 1
 if(-not (Get-ChildItem -Path $outDir) | Where-Object{$_.Name -match "[A-Z]{3}"} `
 | Move-Item -Destination $outDir\logfiles_backup\ -Force)
 
 {throw "0 zipped files moved..."}
 }

 if (-not (test-path "$env:ProgramFiles\7-Zip\7z.exe")) 
{throw "$env:ProgramFiles\7-Zip\7z.exe needed"}
 
 #$zipFilenames = (Get-ChildItem -Path $inDir\*.zip ).Name
 #foreach($zipFilename in $zipFilenames)
 #{

 #Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName  "$a.zip"
 #}
