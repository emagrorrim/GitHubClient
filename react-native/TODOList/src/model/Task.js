export default class Task {
  constructor(title, id = this.ID(), completed = false) {
    this.title = title;
    this.completed = completed;
    this.id = id;
  }

  ID() {
    return '_' + Math.random().toString(36).substr(2, 9);
  }
}