import 'package:flutter/material.dart';
import 'package:lotteryapp/core/model/sharedPreferenceModel/sharedPreferenceModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileCard extends StatefulWidget {
  final String image;
  final String title;
  final Widget? trailing;

  const ProfileCard({
    required this.image,
    required this.title,
    this.trailing,
  });

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  String _userName = '';

  @override
  void initState() {
    super.initState();
    _initUserDetails();
  }

  void _initUserDetails() async {
    _userName = await getUserNameFromPrefs() ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final titleColor = Theme.of(context).colorScheme.onPrimary;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: titleColor,
        backgroundImage: AssetImage(widget.image),
        radius: 24, // Adjust the radius as per your preference
      ),
      title: Text(
        widget.title,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: 1.48,
          color: titleColor,
        ),
      ),
      subtitle: Text(
        _userName,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 19,
          height: 1.6,
          color: titleColor,
        ),
      ),
      trailing: widget.trailing,
    );
  }
}
