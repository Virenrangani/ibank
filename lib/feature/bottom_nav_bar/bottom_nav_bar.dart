import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ibank/core/constant/color/custom_color.dart';
import 'package:ibank/core/constant/padding/custom_padding.dart';
import 'package:ibank/core/image/app_image.dart';
import 'package:ibank/feature/home/presentation/page/home_page.dart';

class BottomNavBar extends StatefulWidget {
  final int initialIndex;

  const BottomNavBar({super.key, this.initialIndex=0});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  final List<Widget> _pages = const [
    HomePage(),
    Center(child: Text("search")),
    Center(child: Text("settings"),),
    Center(child: Text("settings"),)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        transitionBuilder: (child, animation){
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.fastOutSlowIn;

          var tween = Tween(begin: begin, end: end)
              .chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        layoutBuilder: (currentChild, previousChildren) {
          return Stack(
            children: [
              if (currentChild != null) currentChild,
            ],
          );
        },
        child: KeyedSubtree(
          key: ValueKey<int>(_selectedIndex),
          child: _pages[_selectedIndex],
    ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.background,
          boxShadow: [BoxShadow(
            color: AppColors.border,
            blurRadius:6,
          )]
        ),
        padding: AppPadding.edgeAll24,
        child: GNav(
          selectedIndex: _selectedIndex,
          onTabChange: _onItemTapped,
          haptic: true,
          curve: Curves.easeOutExpo,
          duration: Duration(milliseconds: 500),
          gap:6,
          color: AppColors.textSecondary,
          activeColor: AppColors.background,
          iconSize:32,
          tabBackgroundColor: AppColors.primary,
          padding:AppPadding.edgeAll12,
          tabs: [
            GButton(icon: Icons.home, text: "Home",
              leading:SizedBox(
              height: 25,
                width: 25,
                child: Image.asset(AppImage.home,
                  color:_selectedIndex==0?AppColors.background:AppColors.secondaryContainer,)
              )
            ),
            GButton(icon: Icons.search,text: "Search",
                leading:SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(AppImage.search,
                        color:_selectedIndex==1?AppColors.background:AppColors.secondaryContainer)
                )
            ),
            GButton(icon: Icons.person,text: "Message",
                leading:SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(AppImage.message,
                        color:_selectedIndex==2?AppColors.background:AppColors.secondaryContainer)
                )
            ),
            GButton(icon: Icons.person,text: "Setting",
                leading:SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(AppImage.setting,
                        color:_selectedIndex==3?AppColors.background:AppColors.secondaryContainer)
                )
            )
          ],
        ),
      ),
    );
  }
}