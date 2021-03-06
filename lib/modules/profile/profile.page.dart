import 'package:flutter/material.dart';
import 'package:ta_caro/shared/theme/app_theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 65),
              child: Text(
                "Perfil",
                style: AppTheme.textStyles.title.copyWith(fontSize: 36),
              ),
            ),
            SizedBox(height: 17),
            Container(
              decoration: BoxDecoration(
                color: AppTheme.colors.textEnabled,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.restorablePushReplacementNamed(context, '/login');
                },
                title: Text("Sair do App",
                    style: AppTheme.textStyles.titleListTile),
              ),
            )
          ],
        ),
      ),
    );
  }
}
