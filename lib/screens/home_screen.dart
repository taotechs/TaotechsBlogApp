import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final WebViewController controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://www.taotechsolutions.com'),
      );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch $url')),
        );
      }
    }
  }

  void _openLink(String url, {bool isExternal = true}) {
    if (isExternal) {
      _launchURL(url);
    } else {
      controller.loadRequest(Uri.parse(url));
    }
    Navigator.of(context).pop(); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'TAOTECH SOLUTIONS',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.white),
            tooltip: 'Go to Home',
            onPressed: () {
              controller
                  .loadRequest(Uri.parse('https://www.taotechsolutions.com'));
            },
          ),
        ],
      ),
      drawer: AppDrawer(
        onLinkTap: _openLink,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
