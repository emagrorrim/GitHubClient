import React, { Component } from 'react'
import {  
  TabBarIOS,
  View
} from 'react-native'

export default class TabBar extends Component {
  constructor(props) {
    super(props)
    this.state = {
      items: props.items,
      selectedItem: props.selectedItem
    }
  }

  render() {
    return (
      <TabBarIOS>
        {
          this.state.items.map((item) => {
            return (
              <TabBarIOS.Item 
                key={item.title} 
                title={item.title} 
                selected={item.title == this.state.selectedItem.title} 
                onPress={() => {
                  this.setState({
                    selectedItem: item
                  })
                }}
              >
                {item.content}
              </TabBarIOS.Item>
            )
          })
        }
      </TabBarIOS>
    )
  }
}