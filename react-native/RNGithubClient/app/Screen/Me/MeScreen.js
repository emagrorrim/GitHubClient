import React, { Component } from 'react'
import {
  SafeAreaView,
  Text
} from 'react-native'

export default class MeScreen extends Component {
  static navigationOptions = {
    title: 'Me',
  };

  render() {
    return (
      <SafeAreaView>
        <Text>Me</Text>
      </SafeAreaView>
    )
  }
}
