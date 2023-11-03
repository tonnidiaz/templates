import {  tuColors } from "./styles";
import { MD3DarkTheme, MD3Theme } from "react-native-paper";

export  const TuTheme : MD3Theme = {
    ...MD3DarkTheme,
    colors: {
        ...MD3DarkTheme.colors,
        background: tuColors.bg,
        surface: tuColors.bg1,
        onSurface: tuColors.text2,
        inverseOnSurface: tuColors.bg1,
        onTertiaryContainer: "red",
        inverseSurface: tuColors.bg1,
        tertiary: tuColors.bg1,
        tertiaryContainer: tuColors.bg1,
        onBackground: tuColors.bg1,
    
        primary: tuColors.primary,
        inversePrimary: tuColors.primary,
        primaryContainer: tuColors.bg1,
        onPrimary: 'rgb(0,0,0)',
        secondary: tuColors.secondary,
        secondaryContainer: tuColors.secondaryFade,
        onSecondary: "white",
        onSecondaryContainer: "white",
        outlineVariant: "red",
        backdrop: "rgba(4,4,4,.5)",
        elevation: {
            ...MD3DarkTheme.colors.elevation,
            level0: tuColors.bg,
            level1: tuColors.bg,
            level2: tuColors.bg,
            level3: tuColors.bg,
        }
    },
    dark: true,
    
    

}