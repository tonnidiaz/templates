import { View } from "react-native";
import {
    Text,
} from "react-native-paper";
import { tuStyles } from "../utils/styles";
import { TuAppbar } from "@/components/Appbar";

export const AboutScreen = () => {

   return (<>
   <TuAppbar title="About"/>
   <View style={{...tuStyles.wrapper}}>
    <Text>About</Text>
   </View>
   </>
   )
};
