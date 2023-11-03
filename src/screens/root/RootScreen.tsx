import { createBottomTabNavigator } from "@react-navigation/bottom-tabs"
import { CommonActions } from "@react-navigation/native";
import { BottomNavigation } from "react-native-paper";
import { HomeScreen } from "../HomeScreen";
import { WidgetsScreen } from "./widgets/WidgetsScreen";
import MaterialCommunityIcon from 'react-native-vector-icons/MaterialCommunityIcons';
import AntDesignIcon from 'react-native-vector-icons/AntDesign';
import FeatherIcon from 'react-native-vector-icons/Feather';
import { tuColors } from "../../utils/styles";
import { IScrean } from "@/utils/interfaces";
import { AboutScreen } from "../AboutScreen";

const Tab = createBottomTabNavigator()
const screens: IScrean [] = [
    {
        name: "Home", label: "Home", icon: AntDesignIcon, iconName: "home", component: HomeScreen,
    },
    {
        name: "Widgets", label: "Widgets", icon: MaterialCommunityIcon, iconName: "apps", component: WidgetsScreen,
    },
    {
        name: "About", label: "About", icon: FeatherIcon, iconName: "info", component: AboutScreen,
    },
]  
export const RootScreen = ()=>{

 
    return <Tab.Navigator screenOptions={{headerShown: false}} 
    tabBar={({ navigation, state, descriptors, insets }) => (
        <BottomNavigation.Bar
        style={{backgroundColor: tuColors.bg1,}} 
          navigationState={state}
         safeAreaInsets={insets}
          onTabPress={({ route, preventDefault }) => {
            const event = navigation.emit({
              type: 'tabPress',
              target: route.key,
              canPreventDefault: true,
            });

            if (event.defaultPrevented) {
              preventDefault();
            } else {
             navigation.dispatch({
                ...CommonActions.navigate(route.name, route.params),
                target: state.key,
              });
            }
          }}
          renderIcon={({ route, focused, color }) => {
            const { options } = descriptors[route.key];
            if (options.tabBarIcon) {
              return options.tabBarIcon({ focused, color, size: 24 });
            }

            return null;
          }}
          getLabelText={({ route }) => {
            const { options } = descriptors[route.key];
            const label =
              options.tabBarLabel !== undefined ? options.tabBarLabel.toString() : options.title ?? route.name;

            return label;
          }}
        />
      )}
      
    >
 {screens.map(screen=> <Tab.Screen key={screen.name} name={screen.name} component={screen.component} options={{
    tabBarLabel: screen.label, tabBarIcon: ({size, color})=> <screen.icon name={screen.iconName} size={size} color={color}/>
 }} />)}
    </Tab.Navigator>
}