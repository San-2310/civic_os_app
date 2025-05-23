import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../services/notification_service.dart';

class SafetyCheckScreen extends StatelessWidget {
  const SafetyCheckScreen({super.key});

  void _showNotification() {
    NotificationService.showNotification(
      id: 1,
      title: 'Long Wait Alert',
      body: 'You’ve been at the same location for a while. Are you safe?',
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent(
        'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) '
        'AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Mobile/15E148 Safari/604.1',
      )
      ..loadRequest(Uri.parse(
          'https://aa19-2401-4900-1727-dde2-fdf5-7576-b925-fb45.ngrok-free.app'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Safety Check'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notification_important),
            onPressed: _showNotification,
          ),
        ],
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
