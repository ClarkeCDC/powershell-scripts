$StartTime = $(get-date)
$o = Get-ChildItem -File -Path  "/Users/Christian" -Recurse -Include *.jpg, *.png, *.gif
$elapsedTime = $(get-date) - $StartTime
$o |Select-Object |Select fullName, Extension, @{n="Size"; e={$_.length/1MB}},  creationTime,   @{n="Last Modified";e={$_.LastWriteTime.ToString()}}  |Out-GridView


#$o |Select-Object -First 10 |Select fullName, Extension, creationTime,   @{n="Christian";e={$_.LastAccessTime.ToString('yyyy-mm-dd')}}  |ConvertTo-Html -Title "html test" |out-file 1.html


$o |Group-Object -Property Extension |Select Count, Name, @{n="Size"; e={$_.length/1MB}}
#$totalTime = "{0:HH:mm:ss}" -f ([datetime]$elapsedTime.Ticks)
Write-host "Elapsed Time: $($elapsedTime.ToString("ss"))s"
$o[1].GetAccessControl()
