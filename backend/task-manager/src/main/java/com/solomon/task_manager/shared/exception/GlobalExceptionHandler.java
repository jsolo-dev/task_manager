package com.solomon.task_manager.shared.exception;

import com.solomon.task_manager.task.exception.TaskNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;

import java.time.LocalDateTime;
import java.util.List;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(TaskNotFoundException.class)
    public ResponseEntity<ExceptionResponse> taskNotFoundExceptionHandler(TaskNotFoundException exception, WebRequest request) {
        return new ResponseEntity<>(
                new ExceptionResponse(
                        LocalDateTime.now(),
                        404,
                        exception.getMessage(),
                        request.getDescription(false).replace("uri=", "")),
                HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ExceptionResponse> validationExceptionHandler(MethodArgumentNotValidException exception, WebRequest request) {
        List<String> error = exception.getFieldErrors()
                .stream()
                .map(fieldError -> fieldError.getField() + ": " + fieldError.getDefaultMessage())
                .toList();
        return new ResponseEntity<>(new ExceptionResponse(
                LocalDateTime.now(),
                400,
                error,
                request.getDescription(false).replace("uri=", "")
        ), HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(RuntimeException.class)
    public ResponseEntity<ExceptionResponse> globalExceptionHandler(RuntimeException exception, WebRequest request) {
        System.out.println(exception.getMessage());
        return new ResponseEntity<>(new ExceptionResponse(
                LocalDateTime.now(),
                500,
                "Internal Server Error",
                request.getDescription(false).replace("uri=", "")
        ), HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
