#ifndef __CONNECTOR_HH__
#define __CONNECTOR_HH__ 1

#include <mysql/mysql.h>
#include <string>
#include "result.hh"

namespace mysql {

class Connector {
protected:
    MYSQL* connInstance;
public:
    void reset();
    Connector();
    void connect(std::string dbusername, std::string dbpasswd, std::string dbname, std::string addr = "127.0.0.1", int port = 3306);
    Connector(std::string dbusername, std::string dbpasswd, std::string dbname, std::string addr = "127.0.0.1", int port = 3306);
    void close();
    ~Connector();
    Result exec(std::string cmd);
};

}

#endif
