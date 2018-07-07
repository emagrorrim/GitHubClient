import React, { Component } from 'react'
import {
  SafeAreaView,
  Text
} from 'react-native'

export default class NewsScreen extends Component {
  static navigationOptions = {
    title: 'News',
  };

  render() {
    return (
      <SafeAreaView>
        <Text>News</Text>
      </SafeAreaView>
    )
  }
}
