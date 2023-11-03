/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import React from 'react';
import type {PropsWithChildren} from 'react';
import {
  SafeAreaView,
  StatusBar,
  Text,
  View,
} from 'react-native';

import {
  Colors,
} from 'react-native/Libraries/NewAppScreen';



import {
    NavigationContainer,
} from "@react-navigation/native";
import { createNativeStackNavigator } from "@react-navigation/native-stack";
import { TuTheme } from "./src/utils/theme";
import { HomeScreen } from "./src/screens/HomeScreen";
import { PaperProvider } from "react-native-paper";
import { TuAppbar } from "./src/components/Appbar";

const Stack = createNativeStackNavigator();


function App(): JSX.Element {
  const isDarkMode = true;//useColorScheme() === 'dark';

  const backgroundStyle = {
    backgroundColor: isDarkMode ? Colors.darker : Colors.lighter,
  };

  return (
       <PaperProvider theme={TuTheme}>
               <NavigationContainer theme={TuTheme as any}>
            <Stack.Navigator  screenOptions={{
          header: (props) => <TuAppbar {...props} />,
        }}>
                <Stack.Screen name="Home" component={HomeScreen} />
            </Stack.Navigator>
        </NavigationContainer>
        </PaperProvider>
     
  );
}



export default App;
