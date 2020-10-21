Function Get-Folder($initialDirectory="")

{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")|Out-Null

    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.Description = "Select a folder"
    $foldername.rootfolder = "MyComputer"
    $foldername.SelectedPath = $initialDirectory

    if($foldername.ShowDialog() -eq "OK")
    {
        $folder += $foldername.SelectedPath
    }
    return $folder
}

$base_path = Get-Folder
$extra_path = "\_retail_\Interface\AddOns"
$full_path = $base_path + $extra_path
Get-ChildItem -Path $full_path -exclude "*_*" | Select-Object -ExpandProperty Name > addons.txt