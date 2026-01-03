import 'package:flutter/material.dart';
import 'package:fruits_apps/core/utils/app_images.dart';
import 'package:fruits_apps/features/home/domain/entities/buttom_navigation_bar_entity.dart';
import 'package:fruits_apps/features/home/presentation/views/widgets/navigation_bar_item.dart';
import 'package:svg_flutter/svg.dart';

class CustomButtomNavigationBar extends StatefulWidget {
  const CustomButtomNavigationBar({super.key});

  @override
  State<CustomButtomNavigationBar> createState() => _CustomButtomNavigationBarState();
}

class _CustomButtomNavigationBarState extends State<CustomButtomNavigationBar> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: buttomNavigationBarItem.asMap().entries.map((e) {
          var index=e.key;
          var item=e.value;
          return Expanded(
            flex: index== selectedIndex ? 3 : 2,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex=index;
                });
              },
              child: NavigationBarItem(
                isSelected: selectedIndex==index,
                buttomNavigationBarEntity: item,
              ),
            ),
          );
        }).toList()
      ),
    );
  }
}

