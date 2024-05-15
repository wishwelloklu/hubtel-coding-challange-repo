import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({
    super.key,
    required this.date,
  });

  final String date;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Chip(
        label: Text(
          date,
          style: const TextStyle(
            color: Color(0xFF9CABB8),
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFE6EAED),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
