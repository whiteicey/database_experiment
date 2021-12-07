package pers.db.service.impl;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.db.service.QueryAnyService;
import pers.db.service.dao.QueryAnyDAOService;

@Service
public class QueryAnyServiceImpl implements QueryAnyService {
    @Autowired
    public QueryAnyDAOService queryAnyDAOService;

    @Override
    public List<LinkedHashMap<String, Object>> queryAny(String SQLStatement) {
        return this.queryAnyDAOService.getMapper().queryAny(SQLStatement);
    }
    
}
