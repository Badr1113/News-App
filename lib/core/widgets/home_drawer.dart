import 'package:flutter/material.dart';

import '../sources/colors_manager.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final drawerBackground = isDark ? ColorsManager.darkDrawer : Colors.white;
    final primaryText = isDark ? Colors.white : const Color(0xFF1A1A1A);
    final secondaryText = isDark ? Colors.white70 : Colors.black54;

    return Drawer(
      width: MediaQuery.sizeOf(context).width * 0.78,
      backgroundColor: drawerBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 18, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF292929) : Colors.black12,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(Icons.newspaper_rounded, color: primaryText),
                  ),
                  const SizedBox(width: 14),
                  Text(
                    'News App',
                    style: TextStyle(
                      color: primaryText,
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Divider(color: isDark ? Colors.white12 : Colors.black12),
              const SizedBox(height: 10),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                leading: Icon(Icons.home_outlined, color: primaryText),
                title: Text(
                  'Go To Home',
                  style: TextStyle(color: primaryText, fontSize: 15),
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
              const SizedBox(height: 12),
              Divider(color: isDark ? Colors.white12 : Colors.black12),
            ],
          ),
        ),
      ),
    );
  }
}
