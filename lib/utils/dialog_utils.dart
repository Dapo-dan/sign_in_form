import 'package:flutter/material.dart';
import 'package:sign_in_form/widgets/loading_overlay.dart';
import 'package:sign_in_form/widgets/success_dialog.dart';

class DialogUtils {
  static Future<void> showLoadingWithSuccess({
    required BuildContext context,
    required String successTitle,
    required String successMessage,
    required VoidCallback onContinue,
    Duration loadingDuration = const Duration(seconds: 3),
  }) async {
    // Show loading overlay
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const LoadingOverlay(),
    );

    // Wait for specified duration
    await Future.delayed(loadingDuration);

    // Hide loading overlay
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();

    // Show success dialog
    if (context.mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => SuccessDialog(
          title: successTitle,
          message: successMessage,
          onContinue: onContinue,
        ),
      );
    }
  }

  static Future<void> showLoading({
    required BuildContext context,
    Duration loadingDuration = const Duration(seconds: 3),
  }) async {
    // Show loading overlay
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const LoadingOverlay(),
    );

    // Wait for specified duration
    await Future.delayed(loadingDuration);

    // Show a SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('OTP is 123456'),
        duration: const Duration(seconds: 2),
      ),
    );

    // Hide loading overlay
    Navigator.of(context).pop();
  }
}
