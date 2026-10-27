package com.solomon.task_manager.task;

import com.solomon.task_manager.task.command.CreateTaskCommand;
import com.solomon.task_manager.task.command.UpdateTaskCommand;
import com.solomon.task_manager.task.dto.TaskRequest;
import com.solomon.task_manager.task.dto.TaskResponse;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("api/v1/tasks")
public class TaskController {

    private final TaskMapper taskMapper;
    private final TaskService taskService;

    TaskController(TaskMapper taskMapper, TaskService taskService) {
        this.taskMapper = taskMapper;
        this.taskService = taskService;
    }

    @GetMapping
    public List<TaskResponse> getAllTasks() {
        return taskService.getAllTasks()
                .stream()
                .map(taskMapper::toResponse)
                .toList();
    }

    @GetMapping("/{id}")
    public TaskResponse getTaskById(@PathVariable UUID id) {
        return taskMapper.toResponse(taskService.getTaskById(id));
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public TaskResponse createTask(@RequestBody @Valid TaskRequest taskRequest) {
        return taskMapper.toResponse(taskService.createTask(new CreateTaskCommand(
                taskRequest.title(),
                taskRequest.description(),
                taskRequest.completed()
        )));
    }

    @PutMapping("/{id}")
    public TaskResponse updateTask(@PathVariable UUID id, @Valid @RequestBody TaskRequest taskRequest) {
        return taskMapper.toResponse(taskService.updateTaskById(new UpdateTaskCommand(
                id,
                taskRequest.title(),
                taskRequest.description(),
                taskRequest.completed()
        )));
    }

    @DeleteMapping("/{id}")
    public void deleteTask(@PathVariable UUID id) {
        taskService.deleteTaskById(id);
    }

    @DeleteMapping
    public void deleteAllTasksById(@RequestBody List<UUID> taskList) {
        taskService.deleteAllTasksById(taskList);
    }
}
