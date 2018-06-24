import React, { Component } from 'react';
import { Dimensions, SafeAreaView, View } from 'react-native';

import TodoList from '../components/TodoList'

let { height } = Dimensions.get("window");

export default class TodoListScreen extends Component {
  render() {
    return (
      <View style={{backgroundColor: '#f5f5f5', height}}>
        <SafeAreaView>
          <TodoList />
        </SafeAreaView>
      </View>
    )
  }
}
