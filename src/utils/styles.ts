import { StyleSheet } from "react-native";

export const tuColors = {
    bg: "rgba(38, 38, 38, 1)",
    bg1: "rgba(44, 44, 44, 1)",
    bg2: "rgba(78, 78, 78, 1)",
    text: "rgba(255, 255, 255, 0.702)",
    text2: "rgba(255, 255, 255, .8)",
    primary: "rgba(101, 195, 200, 1)",
    onPrimary: "rgba(255,255,255,.8)",
    secondary: "rgba(56, 128, 255, 1)",
    primaryFade: "rgba(101, 195, 200, .3)",
    secondaryFade: "rgba(56, 128, 255, .5)",
    primaryContainer: "rgb(25, 72, 75)"
};
export const tuStyles = StyleSheet.create({
    container: {
        flex: 1,

        alignItems: "center",
        justifyContent: "center",
    },
    wrapper: {
        flex: 1,

        alignItems: "center",
        justifyContent: "center",
    },

    btn: {
        backgroundColor: tuColors.bg1,
        borderRadius: 4,
    },
    chip: {
        backgroundColor: tuColors.bg2,
        color: '#fff',
        borderRadius: 100
    }
});
