import React, { Component } from "react";
import { Paper, TextField, Checkbox, Button } from "@material-ui/core";
import "./App.css"; // Update your CSS file accordingly

class App extends Component {
    state = {
        tasks: [],
        currentTask: ""
    };

    handleChange = (e) => {
        this.setState({ currentTask: e.target.value });
    };

    handleSubmit = (e) => {
        e.preventDefault();
        const { tasks, currentTask } = this.state;
        if (!currentTask.trim()) return;
        const newTask = {
            _id: tasks.length + 1, // You may need to generate a unique ID here
            task: currentTask,
            completed: false
        };
        this.setState({
            tasks: [...tasks, newTask],
            currentTask: ""
        });
    };

    handleUpdate = (taskId) => {
        this.setState((prevState) => ({
            tasks: prevState.tasks.map((task) =>
                task._id === taskId ? { ...task, completed: !task.completed } : task
            )
        }));
    };

    handleDelete = (taskId) => {
        this.setState((prevState) => ({
            tasks: prevState.tasks.filter((task) => task._id !== taskId)
        }));
    };

    render() {
        const { tasks, currentTask } = this.state;
        return (
            <div className="app">
                <header className="app-header">
                    <h1>My To-Do List</h1>
                </header>
                <div className="main-content">
                    <Paper elevation={3} className="todo-container">
                        <form onSubmit={this.handleSubmit} className="task-form">
                            <TextField
                                variant="outlined"
                                size="small"
                                className="task-input"
                                value={currentTask}
                                required={true}
                                onChange={this.handleChange}
                                placeholder="Add New TO-DO"
                            />
                            <Button className="add-task-btn" color="primary" variant="outlined" type="submit">
                                Add Task
                            </Button>
                        </form>
                        <div className="tasks-list">
                            {tasks.map((task) => (
                                <Paper key={task._id} className="task-item">
                                    <Checkbox
                                        checked={task.completed}
                                        onClick={() => this.handleUpdate(task._id)}
                                        color="primary"
                                    />
                                    <div className={task.completed ? "task-text completed" : "task-text"}>
                                        {task.task}
                                    </div>
                                    <Button onClick={() => this.handleDelete(task._id)} color="secondary" className="delete-task-btn">
                                        Delete
                                    </Button>
                                </Paper>
                            ))}
                        </div>
                    </Paper>
                </div>
            </div>
        );
    }
}

export default App;
