import 'package:flutter/cupertino.dart';
import 'package:sign_in_form/constants/styles.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onContinue,
  });

  final String title;
  final String message;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        title,
        style: TextStyles.style17extrabold,
        textAlign: TextAlign.center,
      ),
      content: Text(
        message,
        style: TextStyles.style16regular,
        textAlign: TextAlign.center,
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: onContinue,
          child: const Text(
            'OK',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: CupertinoColors.activeBlue,
            ),
          ),
        ),
      ],
    );
  }
}
