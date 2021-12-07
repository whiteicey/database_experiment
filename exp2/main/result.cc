#include "result.hh"
#include "exception.hh"

using namespace mysql;
using namespace std;

Result::Result(MYSQL_RES* src, int c) {
    this->f = (src != nullptr);
    this->fieldCount = c;

    if (!this->f) return;
    // Get rows
    MYSQL_ROW row;
    while ((row = mysql_fetch_row(src))) {
        this->res.push_back(row);
    }

    // Get columns
    const int sz = this->getFieldCount();
    for (int i = 0; i < sz; ++i) {
        this->cols.push_back(src->fields[i].name);
    }
}

vector<MYSQL_ROW> Result::getResult() const {
    if (!this->f) throw NoResultException();
    return this->res;
}

Result::Result(const Result&& another):
  f(another.f), fieldCount(another.fieldCount),
  res(move(another.res)), cols(move(another.cols)) { }

Result::~Result() { }

bool Result::hasResult() const {
    return this->f;
}

int Result::getFieldCount() const {
    return this->f ? this->fieldCount : 0;
}

vector<string> Result::getColumns() const {
    if (!this->f) throw NoResultException();
    return this->cols;
}
