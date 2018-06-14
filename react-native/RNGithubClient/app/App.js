import React, { Component } from 'react'
import {
  Text
} from 'react-native'
import TabBarController from './Screen/Common/TabBarController'
import LoginScreen from './Screen/Login/LoginScreen'

export default class App extends Component {
  constructor(props) {
    super(props)
    this.state = {
      loggedIn: true
    }
  }
  render() {
    if (this.state.loggedIn) {
      return (<TabBarController />)
    } else {
      return (<LoginScreen />)
    }
  }
}
