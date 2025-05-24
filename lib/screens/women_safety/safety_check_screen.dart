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
          'https://3d5e-2401-4900-1727-dde2-907d-209e-5dc6-b1e5.ngrok-free.app'));

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
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// import '../../services/notification_service.dart';

// class SafetyCheckScreen extends StatefulWidget {
//   const SafetyCheckScreen({super.key});

//   @override
//   State<SafetyCheckScreen> createState() => _SafetyCheckScreenState();
// }

// class _SafetyCheckScreenState extends State<SafetyCheckScreen> {
//   late InAppWebViewController _webViewController;

//   void _showNotification() {
//     NotificationService.showNotification(
//       id: 1,
//       title: 'Long Wait Alert',
//       body: 'You’ve been at the same location for a while. Are you safe?',
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Safety Check'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notification_important),
//             onPressed: _showNotification,
//           ),
//         ],
//       ),
//       body: Container(
//         margin: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         width: MediaQuery.of(context).size.width,
//         child: InAppWebView(
//           initialUrlRequest: URLRequest(
//             url: WebUri(
//                 'https://3d5e-2401-4900-1727-dde2-907d-209e-5dc6-b1e5.ngrok-free.app'),
//           ),
//           initialOptions: InAppWebViewGroupOptions(
//             crossPlatform: InAppWebViewOptions(
//               javaScriptEnabled: true,
//               useOnDownloadStart: true,
//               mediaPlaybackRequiresUserGesture: false,
//             ),
//             android: AndroidInAppWebViewOptions(
//               // Enable geolocation
//               geolocationEnabled: true,
//             ),
//             ios: IOSInAppWebViewOptions(
//               allowsInlineMediaPlayback: true,
//             ),
//           ),
//           onWebViewCreated: (controller) {
//             _webViewController = controller;
//           },
//           androidOnGeolocationPermissionsShowPrompt:
//               (InAppWebViewController controller, String origin) async {
//             // Automatically grant location permission
//             return GeolocationPermissionShowPromptResponse(
//                 origin: origin, allow: true, retain: true);
//           },
//         ),
//       ),
//     );
//   }
// }
// import 'dart:html' as html; // Only used on web

// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// import '../../services/notification_service.dart';

// class SafetyCheckScreen extends StatelessWidget {
//   const SafetyCheckScreen({super.key});

//   void _showNotification() {
//     NotificationService.showNotification(
//       id: 1,
//       title: 'Long Wait Alert',
//       body: 'You’ve been at the same location for a while. Are you safe?',
//     );
//   }

//   void _openInBrowser(String url) {
//     html.window.open(url, '_blank');
//   }

//   @override
//   Widget build(BuildContext context) {
//     const url =
//         'https://3d5e-2401-4900-1727-dde2-907d-209e-5dc6-b1e5.ngrok-free.app';

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Safety Check'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notification_important),
//             onPressed: _showNotification,
//           ),
//         ],
//       ),
//       body: kIsWeb
//           ? Center(
//               child: ElevatedButton(
//                 onPressed: () => _openInBrowser(url),
//                 child: const Text('Open Safety Check in new tab'),
//               ),
//             )
//           : Container(
//               margin: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: WebViewWidget(
//                 controller: WebViewController()
//                   ..setJavaScriptMode(JavaScriptMode.unrestricted)
//                   ..setUserAgent(
//                     'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) '
//                     'AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Mobile/15E148 Safari/604.1',
//                   )
//                   ..loadRequest(Uri.parse(url)),
//               ),
//             ),
//     );
//   }
// }
