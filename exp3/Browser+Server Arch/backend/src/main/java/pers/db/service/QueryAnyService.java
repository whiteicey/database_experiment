package pers.db.service;

import java.util.LinkedHashMap;
import java.util.List;

public interface QueryAnyService {
    public List<LinkedHashMap<String, Object>> queryAny(String SQLStatement);
}
