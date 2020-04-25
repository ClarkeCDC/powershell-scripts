function Get-Dirs ([string]$root, [uint32]$level, [bool]$includeFileTypes) {
    Get-ChildItem -Path $root -Depth $level | Select-Object FullName | Export-Csv "test.csv"
}