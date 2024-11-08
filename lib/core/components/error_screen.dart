import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String code;
  final String message;
  final VoidCallback onResume;

  const ErrorScreen({
    required this.code,
    required this.message,
    required this.onResume,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
