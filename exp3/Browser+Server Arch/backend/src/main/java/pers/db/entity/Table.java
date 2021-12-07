package pers.db.entity;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import lombok.Data;

// NOT DAO entity

@Data
public class Table {
    public List<ColumnInfo> columnInfos;
    public List<List<String>> rows;

    public Table(List<LinkedHashMap<String, Object>> src) {
        this.columnInfos = new ArrayList<ColumnInfo>();
        this.rows = new ArrayList<List<String>>();

        if (src.size() == 0) return;

        // Generate column infos
        Integer cnt = 0;
        for (String i: src.get(0).keySet()) {
            this.columnInfos.add(new ColumnInfo(cnt, i));
            ++cnt;
        }

        // Generate rows data
        for (LinkedHashMap<String, Object> rawRow: src) {
            // For each row
            List<String> row = new ArrayList<String>();
            for (ColumnInfo i: this.columnInfos) {
                // For each column i with name i.name
                if (rawRow.get(i.name) == null) row.add("NULL");
                else row.add(rawRow.get(i.name).toString());
            }
            this.rows.add(row);
        }
    }
}
