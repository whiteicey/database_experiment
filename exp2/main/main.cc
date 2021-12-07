#include <iostream>
#include <set>
#include <map>
#include <string>
#include "connector.hh"
#include "exception.hh"
#include "../util/range.hh"

using namespace std;
using namespace mysql;
using util::Range;

Connector conn;

string _lowercase(const string& in) {
    string ret;
    for (char c: in) {
        if (isupper(c)) {
            ret += c - 'A' + 'a';
        } else {
            ret += c;
        }
    }
    return ret;
}

int main(int argc, char** argv) {
    string passwd;
    if (argc < 2) {
        fprintf(stderr, "Warning: empty password\n");
        passwd = "";
    } else {
        passwd = argv[1];
    }

    try {
        conn.connect("root", passwd.c_str(), "EducationDB", "127.0.0.1", 3306);
    } catch (exception& e) {
        cerr << "FATAL: Failed to connect MySQL" << endl;
        cerr << e.what() << endl;
        return 2;
    }

    string in, cmd;
    string delimiter = ";";
    int prompt_lvl = 0;

    while (1) {
        if (prompt_lvl == 0) {
            cout << "sh> ";
            in.clear(); cmd.clear();
        }
        else cout << " -> ";
        if (!getline(cin, in)) {
            cerr << "FATAL: stdin corrupted" << endl;
            return 3;
        }
        // handle exit
        if (_lowercase(in) == "exit" || _lowercase(in) == "quit") {
            cout << "Quiting" << endl;
            break;
        }
        // handle delimiter change
        if (_lowercase(in.substr(0, 9)) == "delimiter") {
            cmd = in;
            prompt_lvl = 0;
            int i = 9; const int sz = cmd.length();
            for (; i < sz && cmd[i] == ' '; ++i);
            string delim = string(cmd.begin() + i, cmd.end());
            // verify _delim
            bool delim_valid = true;
            for (char c: delim) {
                if (!isgraph(c) || isspace(c)) {
                    cerr << "Invalid delimiter" << endl;
                    delim_valid = false;
                    break;
                }
            }
            if (!delim_valid) continue;
            // if verified, change delimiter
            // MySQL connector will not handle this, so take it easy.
            delimiter = delim;
        } else {
            if (in.empty()) continue;
            // check if command over
            size_t s;
            if ((s = in.find(delimiter)) != string::npos) {
                // if so, reset prompt level, try to execute
                // DELETE THE LAST DELIMITER!!
                cmd += in.substr(0, s);

                prompt_lvl = 0;
                try {
                    Result res = conn.exec(cmd.c_str());
                    if (!res.hasResult()) continue;

                    vector<MYSQL_ROW> resd = res.getResult();
                    vector<string> cols = res.getColumns();
                    const int c = res.getFieldCount();

                    cout << '|';
                    for (string i: cols) {
                        cout << ' ' << i << " |";
                    }
                    cout << endl;
                    cout << "==== data ====" << endl;
                    for (MYSQL_ROW row : resd) {
                        cout << '|';
                        for (int i : Range<int>(0, c)) {
                            cout << ' ' << (row[i] ? row[i] : "NULL") << " |";
                        }
                        cout << endl;
                    }
                } catch (exception& e) {
                    cerr << e.what() << endl;
                }
            } else {
                // otherwise, just continue
                cmd += in;
                prompt_lvl = 1;
            }
        }
    }

    // try {
    //     Connector conn("root", "", "ChatDB", "127.0.0.1", 3306);
    //     Result res = conn.exec("SELECT * FROM User");
    //     vector<MYSQL_ROW> resd = res.getResult();
    //     int c = res.getFieldCount();

    //     for (MYSQL_ROW row : resd) {
    //         for (int i : Range<int>(0, c)) {
    //             cout << row[i] << ' ';
    //         }
    //         cout << endl;
    //     }
    // } catch (exception& e) {
    //     cout << e.what() << endl;
    //     return 1;
    // }
    return 0;
}
