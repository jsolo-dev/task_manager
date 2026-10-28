package com.solomon.task_manager.shared.exception;

import java.time.LocalDateTime;

public record ExceptionResponse(LocalDateTime timestamp, int status, Object error, String path) {
}
