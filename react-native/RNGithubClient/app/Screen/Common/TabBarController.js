import {
  View
} from 'react-native'
import { createBottomTabNavigator, createStackNavigator } from 'react-navigation'

import NewsScreen from '../News/NewsScreen'
import MeScreen from '../Me/MeScreen'

export default createBottomTabNavigator({
  News: createStackNavigator({
    News: { screen: NewsScreen }
  }),
  Me: createStackNavigator({
    Me: { screen: MeScreen }
  })
})
