import { StyleSheet } from "react-native";

export const tuColors = {
    bg: "rgba(48, 48, 48, 1)",
    bg1: "rgba(56, 56, 56, 1)",
    bg2: "rgba(76, 76, 76, 1)",
    text: "rgba(255, 255, 255, 0.702)",
    text2: "rgba(255, 255, 255, .8)",
    primary: "rgba(101, 195, 200, 1)",
    secondary: "rgba(56, 128, 255, 1)",
};
export const tuStyles = StyleSheet.create({
    container: {
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
