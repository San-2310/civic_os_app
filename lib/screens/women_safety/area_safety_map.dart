import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AreaSafetyMapScreen extends StatelessWidget {
  const AreaSafetyMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent(
        'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) '
        'AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Mobile/15E148 Safari/604.1',
      )
      ..loadRequest(Uri.parse(
          'https://4348-2409-40c0-e-abe5-a1fa-6c06-156f-ec3.ngrok-free.app'));

    return Scaffold(
      appBar: AppBar(title: const Text('Area Safety Map')),
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
