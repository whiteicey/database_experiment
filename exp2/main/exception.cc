#include "exception.hh"

using namespace mysql;
using namespace std;

ConnectionFailureException::ConnectionFailureException():
    runtime_error("Connection failed") { }
ConnectionFailureException::ConnectionFailureException(string msg):
    runtime_error(msg) { }

ExecutionFailureException::ExecutionFailureException():
    runtime_error("Execution failed") { }
ExecutionFailureException::ExecutionFailureException(string msg):
    runtime_error(msg) { }

NoResultException::NoResultException():
    runtime_error("This query has no result") { }
NoResultException::NoResultException(string msg):
    runtime_error(msg) { }
