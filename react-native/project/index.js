import { 
  AppRegistry,
  Platform
} from 'react-native'
import iOSApp from './App/iOS/App'
import AndroidApp from './App/Android/App'

AppRegistry.registerComponent('project', () => {
  switch (Platform.OS) {
    case "ios":
      return iOSApp
    case "android":
      return AndroidApp
    default:
      return undefined
  }
})
