import 'package:flutter/material.dart';
import '../models/company.dart';

class CompanyCard extends StatelessWidget {
  final Company company;

  CompanyCard({required this.company});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.business),
        title: Text(company.name),
        subtitle: Text(company.domain),
      ),
    );
  }
}
