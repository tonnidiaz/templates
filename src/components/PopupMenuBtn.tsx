import { tuColors } from "@/utils/styles";
import React, { PropsWithChildren, useEffect, useRef, useState } from "react";
import { View } from "react-native";
import { Menu, Appbar } from "react-native-paper";


type Props = PropsWithChildren<{
    builder: (closeMenu : ()=>void)=> React.ReactNode
}>
export const TuPopupMenuBtn = (props: Props)=>{
    const [visible, setVisible] = useState(false);
    const openMenu = () => setVisible(true);
    const closeMenu = () => setVisible(false);
    const [items, setItems] = useState<React.ReactNode>()
    const viewRef = useRef<any>()
    useEffect(()=>{
        const its= props.builder(closeMenu)
        setItems(its)
    }, [props.builder])
    
    return  <>
    <View ref={viewRef}></View>
    <Menu
    
    visible={visible}
    contentStyle={{backgroundColor: tuColors.bg1}}
    onDismiss={closeMenu}
    
    anchor={
      <Appbar.Action
        icon="dots-vertical"
        onPress={openMenu}
      />
    } >
{items}
   
    </Menu>
    </>  ;
}