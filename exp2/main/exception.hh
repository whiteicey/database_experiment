#ifndef __EXCEPTION_HH__
#define __EXCEPTION_HH__ 1

#include <stdexcept>
#include <string>

namespace mysql {

class ConnectionFailureException : public std::runtime_error {
public:
    ConnectionFailureException();
    ConnectionFailureException(std::string msg);
};

class ExecutionFailureException : public std::runtime_error {
public:
    ExecutionFailureException();
    ExecutionFailureException(std::string msg);
};

class NoResultException : public std::runtime_error {
public:
    NoResultException();
    NoResultException(std::string msg);
};

}

#endif
