#ifndef __RESULT_HH__
#define __RESULT_HH__ 1

#include <mysql/mysql.h>
#include <vector>
#include <string>

namespace mysql {

class Result {
private:
    bool f;
    int fieldCount;
    std::vector<MYSQL_ROW> res;
    std::vector<std::string> cols;
    friend class Connector;

    Result& operator=(const Result& another) = delete;
    Result(const Result& another) = delete;

    Result(MYSQL_RES* src, int c);
public:
    Result(const Result&& another);
    std::vector<MYSQL_ROW> getResult() const;
    ~Result();
    bool hasResult() const;
    int getFieldCount() const;
    std::vector<std::string> getColumns() const;
};

}

#endif
