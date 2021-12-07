#include "connector.hh"
#include "exception.hh"

using namespace mysql;
using namespace std;

void Connector::reset() {
    if (this->connInstance != nullptr) this->close();
    MYSQL *t = mysql_init(this->connInstance);
    this->connInstance = t;
    if (!t) throw bad_alloc();
}

Connector::Connector() {
    this->reset();
}

void Connector::connect(string dbusername, string dbpasswd, string dbname, string addr, int port) {
    MYSQL *t = mysql_real_connect(this->connInstance, addr.c_str(), dbusername.c_str(), dbpasswd.c_str(), dbname.c_str(), port, nullptr, 0);
    if (!t) throw ConnectionFailureException(mysql_error(this->connInstance));
}

Connector::Connector(string dbusername, string dbpasswd, string dbname, string addr, int port) {
    this->connInstance = nullptr;
    this->reset();
    this->connect(dbusername, dbpasswd, dbname, addr, port);
}

void Connector::close() {
    mysql_close(this->connInstance);
    this->connInstance = nullptr;
}

Connector::~Connector() {
    this->close();
    this->connInstance = nullptr;
}

Result Connector::exec(string cmd) {
    int t = mysql_real_query(this->connInstance, cmd.c_str(), cmd.length());
    if (t) throw ExecutionFailureException(mysql_error(this->connInstance));
    MYSQL_RES *ret = mysql_store_result(this->connInstance);
    if (mysql_errno(this->connInstance))
        throw ExecutionFailureException(mysql_error(this->connInstance));
    int c = mysql_field_count(this->connInstance);
    Result res(ret, c);
    // Construction done, free ret
    mysql_free_result(ret);
    // clear extra results, keep only one
    while (mysql_next_result(this->connInstance) == 0) {
        ret = mysql_store_result(this->connInstance);
        // Yet this result here need to be freed
        mysql_free_result(ret);
    }
    return res;
}
