function __exec {
    Param (
        [Parameter(Position=0)]
        [string[]]
        $passwd,

        [Parameter(Position=1)]
        [string[]]
        $filename
    )
    # Get-Content $filename -Encoding UTF8 | mysql -uroot -p"$passwd" --default-character-set=utf8mb4
    mysql -uroot -p"$passwd" --default-character-set=utf8mb4 -e "source $filename"
}

Write-Output "password for mysql:"
$passwd=Read-Host
__exec $passwd ./cleardata.sql
__exec $passwd ./input.sql