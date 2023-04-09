import 'package:dummy_app/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const _EmployeeTestApp());
}

class _EmployeeTestApp extends StatelessWidget {
  const _EmployeeTestApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
