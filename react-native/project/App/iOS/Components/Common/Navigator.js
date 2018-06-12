import React, { Component } from 'react';
import { 
  NavigatorIOS,
  Platform
} from 'react-native';

export default class Navigator extends Component {
  render() {
    return (
      <NavigatorIOS initialRoute={this.props.initialRoute}/>
    );
  }
}