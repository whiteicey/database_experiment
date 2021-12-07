__exec() {
    mysql -uroot -p$1 <$2
}

echo "password for mysql:"
read passwd
__exec $passwd ./dumpDB.sql
