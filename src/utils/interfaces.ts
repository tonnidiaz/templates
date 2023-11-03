import React from "react";
import { Icon } from "react-native-vector-icons/Icon";

export interface IScrean {
    label: string,
    name: string,
    icon: typeof Icon,
    iconName: string,
    component: () => React.JSX.Element
}