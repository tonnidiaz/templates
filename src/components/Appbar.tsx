import React from "react";
import { Appbar, AppbarHeaderProps } from "react-native-paper";

interface Props extends AppbarHeaderProps {
    title: string
}
export const TuAppbar = (props: Props)=>{
    return <Appbar.Header style={{zIndex: 999}}>
        <Appbar.Content title={props.title}/>
        {props.children}
    </Appbar.Header>
}