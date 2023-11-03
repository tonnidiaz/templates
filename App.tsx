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
import { PaperProvider } from "react-native-paper";
import { TuAppbar } from "./src/components/Appbar";
import { RootScreen } from "./src/screens/root/RootScreen";

const Stack = createNativeStackNavigator();


function App(): JSX.Element {


  return (
       <PaperProvider theme={TuTheme}>
               <NavigationContainer theme={TuTheme as any}>
            <Stack.Navigator  screenOptions={{
                headerShown: false,
          /* header: (props) => <TuAppbar {...props} />, */
        }}>
                <Stack.Screen name="Root" component={RootScreen} />
            </Stack.Navigator>
        </NavigationContainer>
        </PaperProvider>
     
  );
}



export default App;
