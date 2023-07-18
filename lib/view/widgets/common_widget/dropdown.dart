import 'package:flutter/material.dart';

///Dropdown component
class DropdownComponent extends StatelessWidget {
  const DropdownComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final onPrimary = Theme.of(context).colorScheme.onPrimary;
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: 'Texas',
        icon: Icon(
          Icons.arrow_drop_down,
          color: onPrimary,
        ),
        elevation: 1,
        onChanged: (String? newValue) {},
        items: <String>['Texas', 'California', 'New York']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                color: onPrimary,
                fontWeight: FontWeight.w700,
                fontSize: 13,
                height: 1,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
