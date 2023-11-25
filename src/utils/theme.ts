import {  tuColors as colors } from "./styles";
import { MD3DarkTheme, MD3Theme } from "react-native-paper";

export  const TuTheme : MD3Theme = {
    ...MD3DarkTheme,
    colors: {
        ...MD3DarkTheme.colors,
        background: colors.bg,
        surface: colors.bg1,
        onSurface: colors.text2,
        inverseOnSurface: colors.bg1,
        onTertiaryContainer: "red",
        inverseSurface: colors.bg1,
        tertiary: colors.bg1,
        tertiaryContainer: colors.bg1,
        onBackground: colors.bg1,
    
        primary: colors.primary,
        inversePrimary: colors.primary,
        primaryContainer: colors.primaryContainer,
        onPrimaryContainer: colors.text,
        onPrimary: colors.onPrimary,
        secondary: colors.secondary,
        secondaryContainer: colors.primaryFade,
        onSecondary: "white",
        onSecondaryContainer: "white",
        outlineVariant: "red",
        backdrop: "rgba(4,4,4,.5)",
        elevation: {
            ...MD3DarkTheme.colors.elevation,
            level0: colors.bg,
            level1: colors.bg,
            level2: colors.bg,
            level3: colors.bg,
            level4: colors.bg,
            level5: colors.bg
        }
    },
    dark: true,
    
    

}