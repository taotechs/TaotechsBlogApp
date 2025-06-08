import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final Function(String, {bool isExternal}) onLinkTap;

  const AppDrawer({
    super.key,
    required this.onLinkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.purple,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/taotechlogo.png',
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Taotech Solutions',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Community & Support',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.deepPurple),
            title: const Text('About Developer'),
            subtitle: const Text('Taofeek Akintunde'),
            onTap: () => onLinkTap(
                'https://taotechs.github.io/taotechsolutionsportfolio/',
                isExternal: false),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.group, color: Colors.green),
            title: const Text('Community WhatsApp'),
            subtitle: const Text('Join our community'),
            onTap: () =>
                onLinkTap('https://chat.whatsapp.com/IkgAJo1VGKdGcTtCSK10mW'),
          ),
          ListTile(
            leading: const Icon(Icons.business, color: Colors.blue),
            title: const Text('LinkedIn'),
            subtitle: const Text('Connect with us'),
            onTap: () =>
                onLinkTap('https://www.linkedin.com/company/taotechsolutions/'),
          ),
          ListTile(
            leading: const Icon(Icons.alternate_email, color: Colors.black),
            title: const Text('X (Twitter)'),
            subtitle: const Text('Follow us'),
            onTap: () => onLinkTap('https://x.com/taotechsols'),
          ),
          ListTile(
            leading: const Icon(Icons.facebook, color: Colors.blueAccent),
            title: const Text('Facebook'),
            subtitle: const Text('Like our page'),
            onTap: () => onLinkTap('https://www.facebook.com/taotechsolutions'),
          ),
          ListTile(
            leading: const Icon(Icons.support_agent, color: Colors.teal),
            title: const Text('WhatsApp Support'),
            subtitle: const Text('+48 506 095 893'),
            onTap: () => onLinkTap('https://wa.me/48506095893'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.star, color: Colors.orange),
            title: const Text('More Cool Features Coming Soon!'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
