// import {  } from 'jest';
import reducer from '../../src/reducers/todoReducer';
import { addTask, deleteTask, updateTask } from '../../src/actions/todoActions';
import Task from '../../src/model/Task';
import { ADD_TASK, DELETE_TASK, UPDATE_TASK } from '../../src/actions/types';

test("todoReducer handle adding tasks", () => {
  const tasks = [];
  const newTask = new Task("task1", "task_id", false);
  const result = reducer(tasks, addTask(newTask));
  expect(result).toEqual([newTask]);
});

test("todoReducer handle deleting tasks", () => {
  const tasks = [new Task("task1", "task_id1", false), new Task("task2", "task_id2", false)];
  const exsitingTask = new Task("task1", "task_id1", false);
  const result = reducer(tasks, deleteTask(exsitingTask));
  expect(result).toEqual([new Task("task2", "task_id2", false)]);
});

test("todoReducer handle deleting tasks when the task deleted is not in the store", () => {
  const tasks = [new Task("task1", "task_id1", false), new Task("task2", "task_id2", false)];
  const exsitingTask = new Task("task3", "task_id3", false);
  const result = reducer(tasks, deleteTask(exsitingTask));
  expect(result).toEqual([new Task("task1", "task_id1", false), new Task("task2", "task_id2", false)]);
});

test("todoReducer handle updating tasks", () => {
  const tasks = [new Task("task1", "task_id", false)];
  const newTask = new Task("task1", "task_id", true);
  const result = reducer(tasks, updateTask(newTask));
  expect(result).toEqual([newTask]);
});

test("todoReducer handle updating tasks when the task deleted is not in the store", () => {
  const tasks = [new Task("task1", "task_id", false)];
  const newTask = new Task("task2", "task_id2", true);
  const result = reducer(tasks, updateTask(newTask));
  expect(result).toEqual(tasks);
});
