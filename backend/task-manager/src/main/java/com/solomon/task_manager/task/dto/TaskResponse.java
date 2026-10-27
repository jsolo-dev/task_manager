package com.solomon.task_manager.task.dto;

import java.util.UUID;

public record TaskResponse(UUID id, String title, String description, Boolean completed) {
}
