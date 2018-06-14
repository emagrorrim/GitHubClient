import {
  View
} from 'react-native'
import { createBottomTabNavigator } from 'react-navigation'

import NewsScreen from '../News/NewsScreen'
import MeScreen from '../Me/MeScreen'

export default createBottomTabNavigator({
  News: NewsScreen,
  Me: MeScreen
})
