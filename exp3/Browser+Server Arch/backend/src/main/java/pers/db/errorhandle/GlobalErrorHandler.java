package pers.db.errorhandle;

import java.sql.SQLSyntaxErrorException;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ControllerAdvice
public class GlobalErrorHandler {
    @ExceptionHandler(SQLSyntaxErrorException.class)
    @ResponseBody
    public ResponseEntity<String> SQLSyntaxErrorExceptionHandler(SQLSyntaxErrorException e) {
        log.warn("SQL exception: " + e.getMessage());
        return new ResponseEntity<String>(e.getMessage(), HttpStatus.FORBIDDEN);
    }
}
