/*This will include scaffold widget and all of its setup
parameter like AppBar, Bottom Navigation, Sidebar etc.
All of the data operations and API calls will be initiated from here
*/

import 'package:agrosage/screens/notification_screen.dart';
import 'package:agrosage/screens/profile_screen.dart';
import 'package:agrosage/screens/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:agrosage/screens/blog_screen.dart';
import 'package:agrosage/screens/detection_screen.dart';
import 'package:agrosage/screens/home_screen.dart';

class AgroSage extends StatefulWidget {
  const AgroSage({super.key});

  @override
  State<AgroSage> createState() {
    return _AgroSageState();
  }
}

class _AgroSageState extends State<AgroSage> {
  int _currentScreenIndex = 0;
  Widget? _currentScreenWidget;



  _changeScreen(int index) {
    setState(() {
      if (index == 2) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const DetectionScreen()),
        );
      }  else if (index == 0) {
        _currentScreenIndex = index;
        _currentScreenWidget = HomeScreen(changeScreen: _changeScreen,);
      } else if (index == 1) {
        _currentScreenIndex = index;
        _currentScreenWidget = const BlogScreen();
      } else if (index == 3) {
        _currentScreenIndex = index;
        _currentScreenWidget = const ShopScreen();
      } else if (index == 4) {
        _currentScreenIndex = index;
        _currentScreenWidget = const ProfileScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return PopScope(
      onPopInvoked: (didPop) => false,
      child: Scaffold(
        backgroundColor: colorScheme.background,
        appBar: AppBar(
          title: Text("${AppLocalizations.of(context)?.greeting('XXX')}"),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen(),));
            }, icon: const Icon(Icons.notifications))
          ],
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            _changeScreen(index);
          },
          backgroundColor: colorScheme.primaryContainer,
          indicatorColor: colorScheme.onPrimaryContainer.withOpacity(.9),
          selectedIndex: _currentScreenIndex,
          destinations: <Widget>[
            NavigationDestination(
              selectedIcon: Icon(
                Icons.home,
                color: colorScheme.primaryContainer,
              ),
              icon: Icon(
                Icons.home_outlined,
                color: colorScheme.onPrimaryContainer,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.chrome_reader_mode_outlined,
                color: colorScheme.primaryContainer,
              ),
              icon: Icon(
                Icons.chrome_reader_mode_outlined,
                color: colorScheme.onPrimaryContainer,
              ),
              label: 'Explore',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.health_and_safety_sharp,
                color: colorScheme.primaryContainer,
              ),
              icon: Icon(
                Icons.health_and_safety_sharp,
                color: colorScheme.onPrimaryContainer,
              ),
              label: 'Doctor',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.shopify_outlined,
                color: colorScheme.primaryContainer,
              ),
              icon: Icon(
                Icons.shopify,
                color: colorScheme.onPrimaryContainer,
              ),
              label: 'Shop',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.person,
                color: colorScheme.primaryContainer,
              ),
              icon: Icon(
                Icons.person,
                color: colorScheme.onPrimaryContainer,
              ),
              label: 'Profile',
            ),
          ],
        ),
        body: _currentScreenWidget?? HomeScreen(changeScreen: _changeScreen),
      ),
    );
  }
}
