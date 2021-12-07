package pers.db.service.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.db.mapper.AnyMapper;
import pers.db.service.dao.QueryAnyDAOService;

@Service
public class QueryAnyDAOServiceImpl implements QueryAnyDAOService {
    @Autowired
    public AnyMapper anyMapper;

    @Override
    public AnyMapper getMapper() {
        return this.anyMapper;
    }
}
