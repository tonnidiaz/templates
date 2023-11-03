import {  tuColors } from "./styles";
import { MD3DarkTheme, MD3Theme } from "react-native-paper";

export  const TuTheme : MD3Theme = {
    ...MD3DarkTheme,
    colors: {
        ...MD3DarkTheme.colors,
        background: tuColors.bg,
        surface: tuColors.bg1,
        primaryContainer: tuColors.bg1,
        tertiary: tuColors.bg1,
        tertiaryContainer: tuColors.bg1,
        onBackground: tuColors.bg1,
    
        primary: tuColors.primary,
        onPrimary: 'red',
        secondary: tuColors.secondary
    },
    dark: true,
    
    

}