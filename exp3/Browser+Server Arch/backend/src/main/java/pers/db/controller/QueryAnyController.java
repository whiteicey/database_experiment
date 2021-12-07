package pers.db.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import pers.db.entity.Table;
import pers.db.service.QueryAnyService;

@RestController
public class QueryAnyController {
    @Autowired
    public QueryAnyService queryAnyService;

    @GetMapping("/sql")
    public Table action(
        @RequestParam(value = "sql", required = true) String SQLStatement
    ) {
        return new Table(this.queryAnyService.queryAny(SQLStatement));
    }
}
