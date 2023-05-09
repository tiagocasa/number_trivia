import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://github.com/tiagocasa');

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      onDestinationSelected: (index) {
        if (index == 0) {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed('/configuration/');
        }
      },
      backgroundColor: Theme.of(context).colorScheme.surface,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 28, left: 16, bottom: 16),
          child: Text(
            'Options',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.settings),
          label: Text('Configurations'),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.exit_to_app),
          label: SizedBox(
            width: 210,
            child: Row(
              children: const [
                TextButton(
                  onPressed: _launchUrl,
                  child: Text(
                    'About Me',
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
