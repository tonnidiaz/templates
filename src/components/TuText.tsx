import { useTheme } from "@react-navigation/native";
import { PropsWithChildren } from "react";
import { Text } from "react-native";

const TuText = (props: PropsWithChildren) => {
    const { colors } = useTheme();
    return <Text style={{ color: colors.text }}>{props.children}</Text>;
};

export default TuText;
