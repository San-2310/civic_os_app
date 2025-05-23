import 'package:flutter/material.dart';

import 'area_safety_map.dart';
import 'safety_check_screen.dart';

class WomenSafetyHome extends StatelessWidget {
  const WomenSafetyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Women Safety')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const SafetyCheckScreen()));
              },
              child: const Text('Still at same location?'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const AreaSafetyMapScreen()));
              },
              child: const Text('Mark Area Safety'),
            ),
          ],
        ),
      ),
    );
  }
}
