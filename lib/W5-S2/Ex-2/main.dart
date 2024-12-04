import 'package:flutter/material.dart';
import 'package:helloflutter/W5-S2/Ex-2/Data/tile.dart';
import 'package:helloflutter/W5-S2/Ex-2/Data/data.dart';
import 'package:helloflutter/W5-S2/Ex-2/Model/model.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(
      profile: visalProfile,
    ),
  ));
}

const Color mainColor = Color(0xff5E9FCD);

class ProfileApp extends StatelessWidget {
  final ProfileData profile;

  const ProfileApp({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor.withAlpha(100),
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text(
          'CADT student Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(profile.avatarUrl),
            ),
            SizedBox(height: 20),
            Text(
              profile.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: mainColor,
              ),
            ),
            Text(
              profile.position,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: profile.tiles.length,
              itemBuilder: (context, index) {
                final tile = profile.tiles[index];
                return ProfileTile(
                  icon: tile.icon,
                  title: tile.title,
                  data: tile.value,
                );
              },
            )

            // ProfileTile(
            //   icon: Icons.phone,
            //   title: "Phone Number",
            //   data: "+123 456 7890",
            // ),
            // ProfileTile(
            //   icon: Icons.location_on,
            //   title: "Address",
            //   data: "Cambodia",
            // ),
          ],
        ),
      ),
    );
  }
}
