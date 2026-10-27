package com.solomon.task_manager.task.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

public record TaskRequest(
        @NotBlank @NotEmpty @Size(max = 100) String title,
        @Size(max = 255)
        String description,
        Boolean completed
) {}
