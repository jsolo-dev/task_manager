package com.solomon.task_manager.task.command;

import java.util.UUID;

public record CreateTaskCommand(
        String title,
        String description,
        Boolean completed
) {}
