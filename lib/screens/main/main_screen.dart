import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moviesta/res/color.dart';
import 'package:moviesta/screens/discover/discover.dart';
import 'package:moviesta/screens/home/home.dart';
import 'package:moviesta/screens/profile/profile.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> tabBodies = [
    HomeScreen(),
    DiscoverScreen(),
    ProfileScreen()
  ];

  List<BottomNavigationBarItem> bottomBarItems = [
    BottomNavigationBarItem(
      icon: InActiveIcon(asset: 'assets/home.svg',),
      activeIcon: ActiveIcon(asset: 'assets/home.svg',),
      label: 'Home'
    ),
    BottomNavigationBarItem(
      icon: InActiveIcon(asset: 'assets/search.svg',),
      activeIcon: ActiveIcon(asset: 'assets/search.svg',),
      label: 'Discover'
    ),
    BottomNavigationBarItem(
      icon: InActiveIcon(asset: 'assets/profile.svg',),
      activeIcon: ActiveIcon(asset: 'assets/profile.svg',),
      label: 'Profile'
    ),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF121212),
        items: bottomBarItems,
        currentIndex: selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 28,
        onTap: (currentIndex) => setState(() => selectedIndex = currentIndex),
      ),
      body: tabBodies[selectedIndex],
    );
  }
}

class InActiveIcon extends StatelessWidget {
  const InActiveIcon({
    Key key, this.asset,
  }) : super(key: key);

  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: SvgPicture.asset(asset , color: white80,)
    );
  }
}

class ActiveIcon extends StatelessWidget {
  const ActiveIcon({
    Key key, this.asset,
  }) : super(key: key);

  final String asset;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: SvgPicture.asset(asset , color: onPrimary,)
        ),
        SizedBox(height:10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 4,
              width: 20,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(50)
              ),
            ),
            SizedBox(width: 3),
            Container(
              height: 4,
              width: 4,
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle
              ),
            )
          ],
        ),
      ],
    );
  }
}