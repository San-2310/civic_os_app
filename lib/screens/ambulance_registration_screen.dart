import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AmbulanceRegistrationScreen extends StatefulWidget {
  const AmbulanceRegistrationScreen({super.key});

  @override
  State<AmbulanceRegistrationScreen> createState() =>
      _AmbulanceRegistrationScreenState();
}

class _AmbulanceRegistrationScreenState
    extends State<AmbulanceRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  // Ambulance basic details
  String ambulanceNumber = '';
  String driverName = '';
  String contactNumber = '';

  bool isRegistered = false;
  bool isActive = false;

  void submitRegistration() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        isRegistered = true;
        isActive = true; // default active after registration
      });

      // Here, do actual API call to register ambulance details
      print('Ambulance Registered: $ambulanceNumber, Driver: $driverName');
    }
  }

  void toggleAmbulanceStatus(bool value) {
    setState(() {
      isActive = value;
      if (isActive) {
        print('Ambulance set to Active');
      } else {
        print('Ambulance set to Inactive');
      }
      // API call to update ambulance status can be done here
    });
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
          'https://85a0-2401-4900-1727-dde2-d5b6-45f7-bb96-cea4.ngrok-free.app'));

    return Scaffold(
      appBar: AppBar(title: const Text('Ambulance Registration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isRegistered
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SwitchListTile(
                    title: const Text('Active Ambulance Status'),
                    value: isActive,
                    onChanged: toggleAmbulanceStatus,
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: WebViewWidget(
                        controller: controller,
                      ),
                    ),
                  ),
                ],
              )
            : Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Ambulance Number',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter ambulance number';
                        }
                        return null;
                      },
                      onSaved: (value) => ambulanceNumber = value!.trim(),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Driver Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter driver name';
                        }
                        return null;
                      },
                      onSaved: (value) => driverName = value!.trim(),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Contact Number',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !RegExp(r'^\d{10}$').hasMatch(value)) {
                          return 'Enter valid 10-digit contact number';
                        }
                        return null;
                      },
                      onSaved: (value) => contactNumber = value!.trim(),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: submitRegistration,
                      child: const Text('Register Ambulance'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
