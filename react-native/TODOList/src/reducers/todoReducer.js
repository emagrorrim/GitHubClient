import { ADD_TASK, DELETE_TASK, UPDATE_TASK } from '../actions/types';

export default (state = [], action) => {
  console.log(action);
  switch (action.type) {
    case ADD_TASK:
      return [action.payload.task, ...state];
    case DELETE_TASK:
      return state.filter((task) => task.id !== action.payload.task.id)
    case UPDATE_TASK:
      state.forEach((task) => {
        if (task.id === action.payload.task.id) {
          task.completed = action.payload.task.completed;
        }
      });
      return [...state]
    default:
      return state
  }
}
