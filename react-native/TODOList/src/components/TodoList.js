import React, { Component } from 'react';
import { Platform, StyleSheet, View, Text, TextInput, TouchableOpacity, ListView } from 'react-native';
import { connect } from 'react-redux';

import TodoListItem from './TodoListItem';
import { addTask, deleteTask, updateTask } from '../actions'
import Task from '../model/Task';

const constants = {
  title: "todos",
  newTaskPlaceholder: "What needs to be done?",
  addButtonTitle: "ADD"
}

class TodoList extends Component {
  constructor(props) {
    super(props);
    this.addTask = this.addTask.bind(this);
    this.onChangeText = this.onChangeText.bind(this);
    this.state = {
      dataSource: new ListView.DataSource({rowHasChanged: (r1, r2) => r1 !== r2 })
    }
  }

  addTask() {
    if (!this.state.title) {
      return
    }
    const task = new Task(this.state.title);
    this.props.addTask(task);
    this.newTaskInput.blur();
    this._clearTextInput();
  }

  _clearTextInput() {
    this.setState({
      title: undefined
    })
  }

  onChangeText(text) {
    this.setState({
      title: text
    })
  }

  render() {
    return (
      <View>
        <ListView 
          style={{paddingBottom: 20}}
          enableEmptySections={true}
          dataSource={this.state.dataSource.cloneWithRows(this.props.tasks)}
          renderHeader={ (value) =>
            <View style={{marginLeft: 10, marginRight: 10}}>
              <Text style={styles.title} >{constants.title}</Text>
              <View style={styles.newTask}>
                <TextInput 
                  style={styles.input}
                  placeholder={constants.newTaskPlaceholder} 
                  onChangeText={this.onChangeText}
                  value={this.state.title}
                  ref={(ref) => this.newTaskInput = ref} 
                />
                <TouchableOpacity style={styles.addButton} onPress={this.addTask}>
                  <Text style={styles.addButtonTitle}>{constants.addButtonTitle}</Text>
                </TouchableOpacity>
              </View>
            </View>
          }
          renderRow={ (task) => 
            <TodoListItem 
              task={task} 
              updateTask={this.props.updateTask} 
              deleteTask={this.props.deleteTask}
            /> 
          }
        />
      </View>
    )
  }
}

const styles = StyleSheet.create({
  title: {
    lineHeight: 200,
    fontWeight: '100',
    fontFamily: Platform.OS === 'android' ? 'sans-serif-light' : 'Helvetica Neue',
    fontSize: 100,
    color: 'rgba(175, 47, 47, 0.15)',
    textAlign: 'center'
  },
  newTask: {
    flexDirection: 'row', 
    borderBottomColor: '#e1e8ee',
    borderBottomWidth: 0.5,
    backgroundColor: 'white',
    shadowColor: 'grey',
    shadowOpacity: 0.2,
    shadowOffset: { 
      width: 2, 
      height: 5
    }
  },
  input: {
    flex: 4,
    marginLeft: 20,
    height: 60,
    fontSize: 18,
    color: 'rgb(77, 77, 77)'
  },
  addButton: {
    flex: 1,
    backgroundColor: 'rgba(175, 47, 47, 0.75)'
  },
  addButtonTitle: {
    color: 'white',
    lineHeight: 60, 
    textAlign: 'center'
  }
})

const mapStateToProps = (state) => {
  return {
    tasks: state.todo
  }
}

export default connect(mapStateToProps, { addTask, deleteTask, updateTask })(TodoList);
