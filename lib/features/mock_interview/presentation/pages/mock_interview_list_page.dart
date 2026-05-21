import 'package:flutter/material.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';

class MockInterviewListPage extends StatelessWidget {
  const MockInterviewListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phỏng vấn Mock')),
      body: const Padding(
        padding: EdgeInsets.all(AppSpacing.screenPaddingPhone),
        child: Center(child: Text('Lịch phỏng vấn với Mentor')),
      ),
    );
  }
}
