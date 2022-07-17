$Disks = Get-Disk | Where partitionstyle -eq 'raw' | Sort number
$Letters = 70..89 | ForEach-Object { [char]$_ }
$Count = 0
$Labels = "data1","data2"

ForEach ( $disk in $disks ) 

{

    $driveLetter = $letters[$count].ToString()
    
    $disk |
    
    Initialize-Disk -PartitionStyle MBR -PassThru | New-Partition -UseMaximumSize -DriveLEtter $driveLetter | Format-Volume -FileSystem NTFS -NewFileSystemLabel $labels[$count] -Confirm:$false -Force
    
    $count++
        
}