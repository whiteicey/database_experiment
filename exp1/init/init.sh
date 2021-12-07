__exec() {
    mysql -uroot -p$1 <$2
}

echo "password for mysql:"
read passwd
__exec $passwd ./createDB.sql
__exec $passwd ./table/Department.sql
__exec $passwd ./table/Student.sql
__exec $passwd ./table/Teacher.sql
__exec $passwd ./table/Course.sql
__exec $passwd ./table/TeachingArrangement.sql
__exec $passwd ./table/CourseOption.sql
