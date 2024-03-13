import 'package:flutter/material.dart';
import 'package:tessprojek/features/account/widgets/account_button.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: 'Your chart',
            ),
            AccountButton(
              text: 'Turn Seller',
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            AccountButton(
              text: 'Your chart',
            ),
            AccountButton(
              text: 'Turn Seller',
            ),
          ],
        ),
      ],
    );
  }
}
