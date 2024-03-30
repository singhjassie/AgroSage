import 'package:flutter/cupertino.dart';


class Setting {
  final String title;
  final String route;
  final IconData icon; // Change type to IconData

  Setting({
    required this.title,
    required this.route,
    required this.icon,
  });
}

final List<Setting> settings = [
  Setting(
    title: "Setting",
    route: '/settings',
    icon: CupertinoIcons.settings_solid,
  ),
  Setting(
    title: "Notifications",
    route: '/notifications',
    icon: CupertinoIcons.bell_fill,
  ),
  Setting(
    title: "Language",
    route: '/',
    icon: CupertinoIcons.globe,
  ),
  Setting(
    title: "Favroite",
    route: '/',
    icon: CupertinoIcons.square_favorites_alt,
  ),
  Setting(
    title: "Help & Feedback",
    route: '/',
    icon: CupertinoIcons.chat_bubble_2_fill,
  ),
  Setting(
    title: "Logout",
    route: '/',
    icon: CupertinoIcons.square_arrow_left,
  ),
];

final List<Setting> settings2 = [
  Setting(
    title: "FAQ",
    route: "/faq",
    icon: CupertinoIcons.ellipsis_vertical_circle_fill,
  ),
  Setting(
    title: "Community",
    route: "/community",
    icon: CupertinoIcons.pencil_circle_fill,
  ),
  Setting(
    title: "Rate",
    route: "/",
    icon: CupertinoIcons.star_fill,
  ),
];