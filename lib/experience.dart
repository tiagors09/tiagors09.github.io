import 'package:flutter/material.dart';

class Experience extends StatelessWidget {
  final String occupation;
  final String company;
  final String startDate;
  final String endDate;
  final String assignments;

  const Experience({
    super.key,
    required this.occupation,
    required this.company,
    required this.startDate,
    required this.endDate,
    required this.assignments,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              occupation,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$company $startDate - $endDate',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
      subtitle: Container(
        margin: const EdgeInsets.only(top: 15),
        child: Text(
          assignments,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
