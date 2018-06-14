import {
  View
} from 'react-native'
import { createBottomTabNavigator } from 'react-navigation'

import NewsContainer from '../News/NewsContainer'
import MeContainer from '../Me/MeContainer'

export default createBottomTabNavigator({
  News: NewsContainer,
  Me: MeContainer
})
