import { tuColors } from "@/utils/styles";
import React from "react";
import { StatusBar } from "react-native";
import { Appbar, AppbarHeaderProps } from "react-native-paper";

interface Props extends AppbarHeaderProps {
    title: string
}
export const TuAppbar = (props: Props)=>{
    return<>
    <StatusBar backgroundColor={tuColors.bg1}/>
    <Appbar.Header style={{zIndex: 999}}>
        <Appbar.Content title={props.title}/>
        {props.children}
    </Appbar.Header></> 
}