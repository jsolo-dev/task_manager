package com.solomon.task_manager.task.dto;

public record TaskRequest(String title, String description, Boolean completed) {
}
