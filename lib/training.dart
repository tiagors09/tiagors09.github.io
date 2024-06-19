import 'package:flutter/material.dart';

class Training extends StatelessWidget {
  final String course;
  final String institute;
  final String startDate;
  final String endDate;

  const Training({
    super.key,
    required this.course,
    required this.institute,
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.amber,
              width: 1.25,
            ),
          ),
        ),
        child: Text(
          '$course $startDate - $endDate',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      subtitle: Container(
        margin: const EdgeInsets.only(top: 15),
        child: Text(
          institute,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
