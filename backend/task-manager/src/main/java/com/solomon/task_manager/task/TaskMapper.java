package com.solomon.task_manager.task;

import com.solomon.task_manager.task.dto.TaskRequest;
import com.solomon.task_manager.task.dto.TaskResponse;
import com.solomon.task_manager.task.entity.Task;
import org.mapstruct.Mapper;

@Mapper
public interface TaskMapper {

    Task toEntity(TaskRequest task);

    TaskResponse toResponse(Task task);
}
