import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('John Doe'),
            accountEmail: Text('johndoe@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://img.freepik.com/premium-photo/abstract-green-gradient-background_728418-18048.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/home'); // ✅ Corrected Route
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us'),
            onTap: () {
              Navigator.pushNamed(context, '/about'); // ✅ Updated Route
            },
          ),
          ListTile(
            leading: Icon(Icons.featured_play_list),
            title: Text('Features'),
            onTap: () {
              Navigator.pushNamed(context, '/features'); // ✅ New Route
            },
          ),
          ListTile(
            leading: Icon(Icons.miscellaneous_services),
            title: Text('Services'),
            onTap: () {
              Navigator.pushNamed(context, '/services'); // ✅ New Route
            },
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text('Feedbacks'),
            onTap: () {
              Navigator.pushNamed(context, '/feedbacks'); // ✅ New Route
            },
          ),
           ListTile(
            leading: Icon(Icons.work),
            title: Text('Projects'),
            onTap: () {
              Navigator.pushNamed(context, '/projects'); // ✅ New Route
            },
          ),
          //  ListTile(
          //   leading: Icon(Icons.people_sharp),
          //   title: Text('Teams'),
          //   onTap: () {
          //     Navigator.pushNamed(context, '/teams'); // ✅ New Route
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.contact_page),
            title: Text('Contact'),
            onTap: () {
              Navigator.pushNamed(context, '/contact'); // ✅ Updated Route
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.support),
          //   title: Text('Support'),
          //   onTap: () {
          //     Navigator.pushNamed(context, '/support'); // ✅ New Route
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.pushNamed(context, '/login'); // ✅ Corrected Route
            },
          ),
        ],
      ),
    );
  }
}
