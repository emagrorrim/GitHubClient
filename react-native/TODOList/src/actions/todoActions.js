import { ADD_TASK, DELETE_TASK, UPDATE_TASK } from '../actions/types';

export const addTask = (task) => {
  return {
    type: ADD_TASK,
    payload: {
      task: task
    }
  }
}

export const deleteTask = (task) => {
  return {
    type: DELETE_TASK,
    payload: {
      task: task
    }
  }
}

export const updateTask = (task) => {
  return {
    type: UPDATE_TASK,
    payload: {
      task: task
    }
  }
}
