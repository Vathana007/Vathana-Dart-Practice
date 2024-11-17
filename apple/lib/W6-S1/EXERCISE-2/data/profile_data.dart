import 'package:flutter/material.dart';
import 'package:apple/W6-S1/EXERCISE-2/model/profile_tile_model.dart';
 
ProfileData ronanProfile = ProfileData(
    name: "Ronan",
    position: "Flutter Developer",
    avatarUrl: 'assets/W6-S1/teacher.jpg',
    colorTheme: const Color(0xff5E9FCD),
    tiles: [
      TileData(
          icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(
          icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
      TileData(icon: Icons.email, title: "Mail", value: "ronan.ogogr@cadt.edu"),
    ]);

ProfileData BottProfile = ProfileData(
    name: "Bott",
    position: "ADC",
    avatarUrl: "assets/W6-S1/bott.jpg",
    colorTheme: const Color(0xFFB0E0E6),
    tiles: [
      TileData(icon: Icons.phone, title: "Phone Number", value: "+1 333 5555"),
      TileData(icon: Icons.location_on, title: "Address", value: "Phnom Penh"),
      TileData(icon: Icons.email, title: "Mail", value: "Bott123@gmail.com"),
      TileData(icon: Icons.color_lens, title: "Color", value: "Blue"),
    ]);

ProfileData RothProfile = ProfileData(
    name: "Roth",
    position: "Defender",
    avatarUrl: "assets/W6-S1/roth.jpg",
    colorTheme: const Color(0xFFC71585),
    tiles: [
      TileData(icon: Icons.phone, title: "Phone Number", value: "+1 444 6666"),
      TileData(icon: Icons.location_on, title: "Address", value: "Phnom Penh"),
      TileData(icon: Icons.email, title: "Mail", value: "Roth123@gmail.com"),
    ]);