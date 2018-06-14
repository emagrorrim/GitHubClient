import React, { Component } from 'react'
import {
  Text
} from 'react-native'
import TabBarContainer from './Container/Common/TabBarContainer'
import LoginContainer from './Container/Login/LoginContainer'

export default class App extends Component {
  constructor(props) {
    super(props)
    this.state = {
      loggedIn: true
    }
  }
  render() {
    if (this.state.loggedIn) {
      return (<TabBarContainer />)
    } else {
      return (<LoginContainer />)
    }
  }
}
