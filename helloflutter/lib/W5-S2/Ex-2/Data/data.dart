import 'package:flutter/material.dart';
//import 'package:test1/W5-S2-List-Inputs/1%20-%20START%20CODE/EXERCISE-2/model/profile_tile_model.dart';
import 'package:helloflutter/W5-S2/Ex-2/Model/model.dart';

ProfileData visalProfile = ProfileData(
    name: "Visal",
    position: "Flutter Developer",
    avatarUrl: 'assets/pic.jpg',
    tiles: [
      TileData(
          icon: Icons.phone, title: "Phone Number", value: "+855 979 212 001"),
      TileData(
          icon: Icons.location_on,
          title: "Address",
          value: "Phonm Penh Cambodia"),
      TileData(
          icon: Icons.email,
          title: "Mail",
          value: "visal.korn@student.cadt.edu.kh"),
    ]);
