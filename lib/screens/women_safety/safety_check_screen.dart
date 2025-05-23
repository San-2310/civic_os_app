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
          'idhar women ka woh sms ke sath wala, is screen pe bhi notif ka icon hai for demo purpose'));

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
