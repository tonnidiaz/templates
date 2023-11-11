import { View } from "react-native";
import { Text } from "react-native-paper";
import { tuStyles } from "../../src/utils/styles";
import TuButton from "@/components/TuButton";
import { TuAppbar } from "@/components/Appbar";

export const HomeScreen = () => {
    return (
        <>
            <TuAppbar title="Home">
                
            </TuAppbar>
            <View style={{ ...tuStyles.wrapper }}>
                <Text>HOME</Text>
                <TuButton onPress={() => console.log("PRESS")}>
                    <Text>Click me</Text>
                </TuButton>
            </View>
        </>
    );
};
