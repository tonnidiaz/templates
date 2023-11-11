import { View, StatusBar, Alert, ScrollView } from "react-native";
import { tuColors } from "../../../utils/styles";
import React, { useState } from "react";
import {
    Checkbox,
    ProgressBar,
    Portal,
    Snackbar,
    Text,
    TextInput,
    Switch,
    FAB as Fab,
    Menu,
    Dialog,
    Button,
} from "react-native-paper";
import TuButton from "@/components/TuButton";
import { TuChip } from "@/components/TuChip";
import { screenSize } from "@/utils/constants";
import { TuAppbar } from "@/components/Appbar";
import { TuPopupMenuBtn } from "@/components/PopupMenuBtn";
import { useNavigation } from "@react-navigation/native";
import { TuDialog } from "@/components/Dialog";

export const WidgetsScreen = () => {
    const [snackVisible, setSnackVisible] = useState(false);
    const [dlgVisible, setDlgVisible] = useState(false);
    const b = useNavigation();
    return (
        <>
            <TuAppbar title="Widgets">
                <TuPopupMenuBtn
                    builder={(fn) => [
                        <Menu.Item
                            key={0}
                            onPress={() => {
                                console.log("Option 1 was pressed");
                                fn();
                            }}
                            title="Option 1"
                        />,
                        <Menu.Item
                            key={1}
                            onPress={() => {
                                console.log("Option 2 was pressed");
                                fn();
                            }}
                            title="Option 2"
                        />,
                        <Menu.Item
                            key={2}
                            onPress={() => {
                                console.log("Option 3 was pressed");
                                fn();
                            }}
                            title="Option 2"
                        />,
                    ]}
                ></TuPopupMenuBtn>
            </TuAppbar>
            <ScrollView >
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

                    <TextInput
                        keyboardAppearance="dark"
                    autoFocus={false}
                        right={<TextInput.Icon size={20} icon={"home"} />}
                        style={{
                            width: screenSize.width - 20,
                            backgroundColor: tuColors.bg1,
                        }}
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
                    <Portal>
                        <Snackbar
                            duration={2000}
                            visible={snackVisible}
                            onDismiss={() => {
                                setSnackVisible(false);
                            }}
                        >
                            <Text>
                                Hey I am snack! Look at mee!
                            </Text>
                            
                        </Snackbar>
                    </Portal>
                   
                    <TuButton onPress={()=>{
                        console.log('shwng...');
                        setDlgVisible(true)}}>
                        <Text>Show dialog</Text>
                    </TuButton>
                    
                    <TuButton onPress={() => setSnackVisible(true)}>
                        <Text>Show snack</Text>
                    </TuButton>
        

                    <TuDialog
                        title="Dialog"
                        visible={dlgVisible}
                        
                        onDismiss={() =>{
                            setDlgVisible(false)}}
                    >
                        <Dialog.Content>
                            <Text>My dialog</Text>
                        </Dialog.Content>
                        <Dialog.Actions>
                            <Button onPress={()=> setDlgVisible(false)}>Cancel</Button>
                            <Button onPress={()=> {
                                console.log("DISMIZ");
                                setDlgVisible(false)}}>Ok</Button>
                        </Dialog.Actions>
                        
                    </TuDialog>
                  
                </View>
                <StatusBar />
            </ScrollView>
            <Fab
                        style={{ position: "absolute", bottom: 20, right: 20 }}
                        icon="plus"
                        onPress={() => Alert.alert("Alert", "This the message")}
                    />
        </>
    );
};
