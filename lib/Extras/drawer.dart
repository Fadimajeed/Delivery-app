import 'package:delivery/Extras/drawer_tiles.dart';
import 'package:delivery/Pages/settings_page.dart';
import 'package:delivery/services/Auth/auth_service.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  // log out method
  void logout(){
    final _authService = AuthService();
    _authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Icon(Icons.manage_accounts_rounded, size: 100),
        ),
          Padding(
            padding:  EdgeInsets.all(20),
            child: Divider(),
          ),
        DrawerTiles( text: "H O M E", icon: Icons.home, onTap: ()=> Navigator.pop(context),),
        DrawerTiles( text: "S E T T I N G S", icon: Icons.settings, onTap: (){
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
        }),
        Spacer(),
        DrawerTiles( text: "L O G O U T", icon: Icons.logout, onTap: logout),
        SizedBox(height: 25,)
      ],),
    );
  }
}