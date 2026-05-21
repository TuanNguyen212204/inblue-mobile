import 'package:flutter/material.dart';
import 'package:inblue_mobile/design_system/components/app_primary_button.dart';
import 'package:inblue_mobile/design_system/tokens/app_spacing.dart';

class AiInterviewListPage extends StatelessWidget {
  const AiInterviewListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phỏng vấn AI')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.screenPaddingPhone),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: AppPrimaryButton(
                label: 'Tạo buổi mới',
                icon: Icons.add,
                onPressed: () {
                  // TODO: navigate to setup
                },
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            const Expanded(
              child: Center(child: Text('Danh sách buổi phỏng vấn AI')),
            ),
          ],
        ),
      ),
    );
  }
}
