import 'package:easy_flutter/widgets/m_fit_box_widget.dart';
import 'package:flutter/material.dart';

/**
 * @Author: fanyuqing
 * @Description:
 * @date: 2022/5/17
 */
class CustomWidgetPage extends StatelessWidget {
  const CustomWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widgets"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildRow("9000000000000000000000"),
            MFitBoxWidget(child: _buildRow("9000000000000000000000")),
            MFitBoxWidget(child: _buildRow("123")),
            _buildRow("123"),
          ],
        ),
      ),
    );
  }

  Row _buildRow(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(text),
        Text(text),
        Text(text),
      ],
    );
  }
}
