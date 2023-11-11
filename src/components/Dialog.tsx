import React, {  } from "react";
import { Dialog, DialogProps, Portal } from "react-native-paper";

interface IProps extends DialogProps {
    title: string,
    
}
export const TuDialog: React.FC<IProps> = ({ title, children, ...props }) => {
    return (
        <Portal>
            <Dialog {...props} >
                <Dialog.Title>Alert</Dialog.Title>
                {children}
            </Dialog>
        </Portal>
    );
};
