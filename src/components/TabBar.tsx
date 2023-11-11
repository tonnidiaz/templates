import { tuColors } from '@/utils/styles';
import { BottomTabBarProps } from '@react-navigation/bottom-tabs';
import { useEffect } from 'react';
import { View, Text, TouchableOpacity } from 'react-native';

interface IProps extends BottomTabBarProps{}
export const MyTabBar  = ({ state, descriptors, navigation } : IProps) => {

  return (
    <View style={{ flexDirection: 'row', backgroundColor: tuColors.bg1, height: 60, alignItems: "center", justifyContent: "space-around" }}>
      {state.routes.map((route, index) => {
        const { options } = descriptors[route.key];
        const label =
          options.tabBarLabel !== undefined
            ? options.tabBarLabel
            : options.title !== undefined
            ? options.title
            : route.name;

        const isFocused = state.index === index;

        const onPress = () => {
            console.log("On press");
          const event = navigation.emit({
            type: 'tabPress',
            target: route.key,
            canPreventDefault: true,
          });

          if (!isFocused && !event.defaultPrevented) {
            navigation.navigate(route.name, route.params);
          }
        };

        const onLongPress = () => {
          navigation.emit({
            type: 'tabLongPress',
            target: route.key,
          });
        };

        return (
          <TouchableOpacity
          key={`tab-${index * 4}`}
            accessibilityRole="button"
            accessibilityState={isFocused ? { selected: true } : {}}
            accessibilityLabel={options.tabBarAccessibilityLabel}
            testID={options.tabBarTestID}
            onPress={onPress}
            onLongPress={onLongPress}
            style={{ flex: 1,  alignItems: 'center' }}
          >
            <Text style={{ color: isFocused ? tuColors.primary : tuColors.text }}>
              {`${label}`}
            </Text>
          </TouchableOpacity>
        );
      })}
    </View>
  );
}

