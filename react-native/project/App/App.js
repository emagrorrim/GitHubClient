import React, { Component } from 'react';
import {
  SafeAreaView,
  Text
} from 'react-native';
import Root from './Root';

export default class App extends Component {
  render() {
    return (
      <SafeAreaView>
        <Root />
      </SafeAreaView>
    );
  }
}
