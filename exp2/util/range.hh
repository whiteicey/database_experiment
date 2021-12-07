#ifndef __RANGE_HH__
#define __RANGE_HH__ 1

#include <cmath>
#include <stdexcept>

namespace util {

template<class T>
class Range {
private:
    T lbound, rbound, step;
public:
    Range(T l, T r) {
        this->lbound = l;
        this->rbound = r;
        this->step = l > r ? -1 : 1;
    }
    Range(T l, T r, T step) {
        if (step == 0) throw std::invalid_argument("step cannot be 0");
        this->lbound = l;
        this->rbound = r;
        step = abs(step);
        this->step = l > r ? -step : step;
    }
    class iterator {
    private:
        T val;
        Range* s;
        friend class Range;
    public:
        iterator(Range* src, T val) {
            this->s = src;
            this->val = val;
        }
        iterator(const iterator& another) {
            this->s = another.s;
            this->val = another.val;
        }
        iterator& operator++() {
            if (this->val != this->s->rbound) {
                this->val += this->s->step;
                if (this->s->step > 0) {
                    if (this->val > this->s->rbound)
                        this->val = this->s->rbound;
                } else {
                    if (this->val < this->s->rbound)
                        this->val = this->s->rbound;
                }
            }
            return *this;
        }
        T operator*() {
            return this->val;
        }
        bool operator==(const iterator& another) {
            return this->s == another.s && this->val == another.val;
        }
        bool operator!=(const iterator& another) {
            return this->s != another.s || this->val != another.val;
        }
    };
    iterator begin() {
        return iterator(this, this->lbound);
    }
    iterator end() {
        return iterator(this, this->rbound);
    }
};

}

#endif
