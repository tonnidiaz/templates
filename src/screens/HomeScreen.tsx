import { Alert, StatusBar, View } from "react-native";
import { tuStyles } from "../utils/styles";
import {
    Button,
    Checkbox,
    Chip,
    FAB as Fab,
    Icon,
    ProgressBar,
    Snackbar,
    Switch,
    Text,
    TextInput,
} from "react-native-paper";
import { screenSize } from "../utils/constants";
import { TuChip } from "../components/TuChip";
import { useState } from "react";
import TuButton from "../components/TuButton";

export const HomeScreen = () => {

    const [snackVisible, setSnackVisible] = useState(false)
    return (
        <View
            style={{ flex: 1, alignItems: "center", justifyContent: "center" }}
        >
            <View
                style={{
                    flex: 1,
                    alignItems: "center",
                    justifyContent: "center",
                    gap: 10,
                    padding: 10,
                    margin: "auto",
                }}
            >
                <Text>Tuned</Text>
              

                <TextInput
                    left={<TextInput.Icon size={20} icon={"camera"} />}
                    right={<TextInput.Icon size={20} icon={"send"} />}
                    style={{ width: screenSize.width - 20 }}
                    placeholder="Enter username..."
                    label={"Username:"}
                ></TextInput>

                <TuChip>
                    <Text>Pending</Text>
                </TuChip>
                <Switch value={true} />
                <Checkbox.Item
                    mode="ios"
                    label="Online"
                    status="checked"
                    onPress={(e) => console.log()}
                />
                <ProgressBar indeterminate={true} style={{ width: 160 }} />

                <TuButton onPress={()=> setSnackVisible(true)}><Text>Show snack</Text></TuButton>
                <Snackbar visible={snackVisible} onDismiss={()=>{setSnackVisible(false)}}>
                    Hey I am snack! Look at mee!
                </Snackbar>
                <Fab style={{position: "absolute", bottom: 20, right: 20}}
                    icon="plus"
                    onPress={() => Alert.alert("Alert", "This the message")}
                />
            </View>
            <StatusBar />
        </View>
    );
};
