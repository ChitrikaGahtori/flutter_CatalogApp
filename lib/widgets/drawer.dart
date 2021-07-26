import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  // const MYDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageURL = "https://avatars.githubusercontent.com/u/74341338?s=400&u=c7310a90ac91486e32b27af40f3cb3d6e3c4b8f1&v=4";
    
    return Drawer(
      child: Container(
        color: context.theme.buttonColor,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Chitrika Gahtori"),
                accountEmail: Text("gahtorichitrika7272@gmail.com"),
                // currentAccountPicture: Image.network(imageURL),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageURL),
                ),
              ),
            ),

            ListTile(
              leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            ListTile(
              leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            ListTile(
              leading: Icon(
                  CupertinoIcons.mail,
                  color: Colors.white
              ),
              title: Text(
                "Email me",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
