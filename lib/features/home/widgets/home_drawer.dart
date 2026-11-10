import 'package:flutter/material.dart';
import 'package:news_app/core/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/sources/colors_manager.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = context.read<HomeProvider>();
    return Drawer(
      width: MediaQuery.sizeOf(context).width * 0.78,
      backgroundColor: ColorsManager.black,
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
                      color: ColorsManager.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      Icons.newspaper_rounded,
                      color: ColorsManager.black,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Text(
                    'News App',
                    style: TextStyle(
                      color: ColorsManager.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Divider(color: Colors.white),
              const SizedBox(height: 10),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                leading: Icon(Icons.home_outlined, color: ColorsManager.white),
                title: Text(
                  'Go To Home',
                  style: TextStyle(color: ColorsManager.white, fontSize: 15),
                ),
                onTap: () {
                  homeProvider.goToHome();
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(height: 12),
              Divider(color: ColorsManager.white),
            ],
          ),
        ),
      ),
    );
  }
}
