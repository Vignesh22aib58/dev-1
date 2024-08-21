#!/bin/bash

TASK_FILE="tasks.txt"

# Function to add a task
add_task() {
    echo "Enter the task description:"
    read task
    echo $task >> $TASK_FILE
    echo "Task added."
}

# Function to view tasks
view_tasks() {
    if [ -f $TASK_FILE ]; then
        echo "Your tasks:"
        nl $TASK_FILE
    else
        echo "No tasks found."
    fi
}

# Function to remove a task
remove_task() {
    view_tasks
    echo "Enter the task number to remove:"
    read task_number
    sed -i "${task_number}d" $TASK_FILE
    echo "Task removed."
}

# Menu for the task manager
while true; do
    echo
    echo "Simple Task Manager"
    echo "1. Add Task"
    echo "2. View Tasks"
    echo "3. Remove Task"
    echo "4. Exit"
    echo "Choose an option:"
    read option
    case $option in
        1) add_task ;;
        2) view_tasks ;;
        3) remove_task ;;
        4) break ;;
        *) echo "Invalid option." ;;
    esac
done
