package pers.db.mapper;

import java.util.LinkedHashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AnyMapper {
    public List<LinkedHashMap<String, Object>> queryAny(String SQLStatement);
}
