import 'package:flutter/material.dart';
import 'package:lotteryapp/view/screen/profile_screen/widgets/document_tab.dart';
import 'package:lotteryapp/view/screen/profile_screen/widgets/personal_tab.dart';
import 'package:lotteryapp/view/screen/profile_screen/widgets/security_tab.dart';
import 'package:lotteryapp/view/screen/profile_screen/widgets/tab_bar_item.dart';

class CustomTabbedLayout extends StatelessWidget {
  const CustomTabbedLayout({
    required this.nameController,
    required this.addressController,
    required this.phoneController,
    required this.genderController,
    required this.securityField1Controller,
    required this.securityField2Controller,
    required this.securityField3Controller,
    required this.documentController,
    required this.emailController,
    super.key,
  });
  final TextEditingController nameController;
  final TextEditingController addressController;
  final TextEditingController phoneController;
  final TextEditingController genderController;
  final TextEditingController emailController;
  final TextEditingController securityField1Controller;
  final TextEditingController securityField2Controller;
  final TextEditingController securityField3Controller;
  final TextEditingController documentController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.grey,
            dividerColor: Color(0xff414BC3),
            tabs: [
              TabBarItem(
                title: 'Person',
                content: Icon(
                  Icons.person,
                  size: 20,
                ),
              ),
              TabBarItem(
                title: 'Security',
                content: Icon(
                  Icons.security,
                  size: 20,
                ),
              ),
              TabBarItem(
                title: 'Document',
                content: Icon(
                  Icons.edit_document,
                  size: 20,
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                PersonalTab(
                  emailController: emailController,
                  nameController: nameController,
                  addressController: addressController,
                  phoneController: phoneController,
                  genderController: genderController,
                ),
                SecurityTab(
                  securityField1Controller: securityField1Controller,
                  securityField2Controller: securityField2Controller,
                  securityField3Controller: securityField3Controller,
                ),
                DocumentTab(documentController: documentController),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
