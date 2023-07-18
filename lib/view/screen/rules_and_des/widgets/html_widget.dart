import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlViewPage extends StatelessWidget {
  final String htmlContent;

  HtmlViewPage({required this.htmlContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Html(data: htmlContent),
      ),
    );
  }
}
