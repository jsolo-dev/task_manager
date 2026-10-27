package com.solomon.task_manager.task;

import com.solomon.task_manager.task.command.CreateTaskCommand;
import com.solomon.task_manager.task.command.UpdateTaskCommand;
import com.solomon.task_manager.task.entity.Task;
import com.solomon.task_manager.task.exception.TaskNotFoundException;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Transactional
@Service
public class TaskService {

    private final TaskRepository taskRepository;

    public TaskService(TaskRepository taskRepository) {
        this.taskRepository = taskRepository;
    }

    public List<Task> getAllTasks() {
        return taskRepository.findAll();
    }

    public Task getTaskById(UUID id) {
        return taskRepository.findById(id)
                .orElseThrow(() -> new TaskNotFoundException("Task with id: " + id + " not found"));
    }

    public Task createTask(CreateTaskCommand createTaskCommand) {
        Task newTask = Task.builder()
                .id(createTaskCommand.id())
                .title(createTaskCommand.title())
                .description(createTaskCommand.description())
                .completed(createTaskCommand.completed())
                .build();

        return taskRepository.save(newTask);
    }

    public Task updateTaskById(UpdateTaskCommand updateTaskCommand) {
        Task existingTask = taskRepository.findById(updateTaskCommand.id())
                .orElseThrow(
                        () -> new TaskNotFoundException("Task with id: "
                                + updateTaskCommand.id() + " not found")
                );
        existingTask.setTitle(updateTaskCommand.title());
        existingTask.setDescription(updateTaskCommand.description());
        existingTask.setCompleted(updateTaskCommand.completed());

        return taskRepository.save(existingTask);
    }

    public void deleteTaskById(UUID id) {
        taskRepository.deleteById(id);
    }

    public void deleteAllTasksById(List<UUID> idList) {
        taskRepository.deleteAllById(idList);
    }
}
