import 'package:flutter/material.dart';
import 'package:lotteryapp/view/screen/profile_screen/widgets/passport_cont.dart';

class DocumentTab extends StatelessWidget {
  const DocumentTab({required this.documentController, super.key});
  final TextEditingController documentController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Handle photo upload here
            },
            child: const Text('Upload Photo'),
          ),
          const SizedBox(height: 10),
          const PassportContainer(),
        ],
      ),
    );
  }
}
