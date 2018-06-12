import React, { Component } from 'react';
import { 
  TabBarIOS,
  View
} from 'react-native';

import TabBar from './Components/Common/TabBar';
import Navigator from './Components/Common/Navigator'

const items = [
  {
    title: "News",
    content: (
      <Navigator initialRoute={{
        component: View,
        title: 'News',
      }}/>
    )
  },
  {
    title: "Me",
    content: (
      <Navigator initialRoute={{
        component: View,
        title: 'Me',
      }}/>
    )
  }
]

export default class Root extends Component {
  render() {
    return (
      <TabBar items={items} selectedItem={items[0]}/>
    );
  }
}