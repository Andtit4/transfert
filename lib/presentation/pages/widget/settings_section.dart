import 'package:flutter/material.dart';

class SettingsSection extends StatelessWidget {
  final List<SettingsItem> items;

  const SettingsSection({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
      color: Colors.grey[100],
borderRadius: BorderRadius.all(Radius.circular(25))
      ),
      child: Column(
        children: items.map((item) {
          final index = items.indexOf(item);
          return Column(
            children: [
              ListTile(
                leading: Icon(item.icon),
                title: Text(item.title),
                trailing: item.trailing,
                onTap: item.onTap,
              ),
              if (index < items.length - 1)
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Divider(height: 1, color: const Color.fromARGB(158, 158, 158, 158), )),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class SettingsItem {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingsItem({
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  });
}