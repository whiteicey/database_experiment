function __exec {
    Param (
        [Parameter(Position=0)]
        [string[]]
        $passwd,

        [Parameter(Position=1)]
        [string[]]
        $filename
    )
    Get-Content $filename -Encoding UTF8 | mysql -uroot -p"$passwd"
}

Write-Output "password for mysql:"
$passwd=Read-Host
__exec $passwd ./dumpDB.sql
