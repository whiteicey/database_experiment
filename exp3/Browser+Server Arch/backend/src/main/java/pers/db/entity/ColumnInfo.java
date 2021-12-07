package pers.db.entity;

import lombok.Data;

// NOT DAO entity

@Data
public class ColumnInfo {
    public Integer id;
    public String name;

    public ColumnInfo(Integer id, String name) {
        this.id = id;
        this.name = name;
    }
}
