import 'package:flutter/material.dart';
import 'package:projeto_99freelas/widgets/profile_photo.widget.dart';
import 'package:projeto_99freelas/widgets/text_widget.dart';
import 'package:badges/badges.dart' as badges;

class AppbarWidget extends StatelessWidget implements  PreferredSizeWidget {
  AppbarWidget({
    super.key,
    this.title = '',
    this.isCenterTitle,
    this.elevation,
    this.backgroundColor,
    this.showProfile = false,
    this.showLogo = false,
  });

  final String title;
  final bool? isCenterTitle;
  final double? elevation;
  final Color? backgroundColor;
  bool showProfile = false;
  bool showLogo = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme:  IconThemeData(
        color: backgroundColor == null 
          ? Colors.black 
          : Colors.white
      ),  
      elevation: 20,
      centerTitle: true,
      shadowColor: Colors.black.withOpacity(0.6),
      scrolledUnderElevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: 
         Image.asset(
          "images/truck.png",
          color: Colors.orange,
         ),
      ),
      actions: [
        Visibility(
          visible: showProfile,
          child: GestureDetector(
            onTap: () {
              // Do something...
            },
            child: Row(
              children: [
                badges.Badge(
                  showBadge: true,
                  position: badges.BadgePosition.center(),
                  onTap: () {
                    print("Do something...");
                  },
                  child: const Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.grey,
                  ),
                ),
                ProfilePhotoWidget(
                  width: 48,
                  height: 48,
                  margin: const EdgeInsets.only(right: 16, left: 16),
                ),
              ],
            ),
          ),
        )
      ],
      title: title == '' && showLogo ? Image.asset(
        "images/logo.png",
        fit: BoxFit.cover,
        height: 150,
        width: 150,
      ) : TextWidget(title, customFontsize: 25),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
