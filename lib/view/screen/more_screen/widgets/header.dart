import 'package:flutter/material.dart';

class CustomDrawerItem extends StatelessWidget {
  const CustomDrawerItem({
    required this.leading,
    required this.title,
    required this.subtitle,
    super.key,
  });
  final Widget leading;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final onPrimary = Theme.of(context).colorScheme.onPrimary;
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    final titleStyle = TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: onPrimary,
    );

    final subtitleStyle = TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      fontSize: 13,
      color: onPrimary,
    );

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: onPrimary,
        child: ClipOval(
          child: SizedBox(
            width: screenWidth * 0.1,
            height: screenHeight * 0.1,
            child: leading,
          ),
        ),
      ),
      title: Text(
        title,
        style: titleStyle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        subtitle,
        style: subtitleStyle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Icon(
        Icons.more_vert,
        color: onPrimary,
      ),
      onTap: () {
        // Handle item tap
      },
    );
  }
}
