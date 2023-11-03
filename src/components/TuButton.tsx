import React from "react";
import { Button, ButtonProps } from "react-native-paper";
import { tuStyles } from "../utils/styles";

const TuButton: React.FC<ButtonProps> = (props) => {
    return ( <Button mode="elevated" {...props} style={tuStyles.btn}>

    </Button> );
}
 
export default TuButton;