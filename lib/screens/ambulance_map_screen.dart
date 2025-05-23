import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../services/notification_service.dart';

class AmbulanceMapScreen extends StatelessWidget {
  const AmbulanceMapScreen({super.key});

  void _showNotification() {
    NotificationService.showNotification(
      id: 0,
      title: 'Ambulance Nearby',
      body: 'Stay alert and give way to emergency vehicle.',
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent(
        'Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 '
        '(KHTML, like Gecko) Chrome/94.0.4606.61 Mobile Safari/537.36',
      )
      ..loadRequest(Uri.parse(
          'https://85a0-2401-4900-1727-dde2-d5b6-45f7-bb96-cea4.ngrok-free.app'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ambulance Map'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notification_important),
            onPressed: _showNotification,
          ),
        ],
      ),
      body: Expanded(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: WebViewWidget(
            controller: controller,
          ),
        ),
      ),
    );
  }
}
