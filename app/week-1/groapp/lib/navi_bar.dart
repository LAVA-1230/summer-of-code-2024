import "package:flutter/material.dart";
import "package:google_nav_bar/google_nav_bar.dart";

class NaviBar extends StatefulWidget {
  const NaviBar({super.key});

  @override
  State<NaviBar> createState() => _NaviBarState();
}

class _NaviBarState extends State<NaviBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              gap: 8,
              padding: EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: "Home",
                ),
                GButton(icon: Icons.scanner, text: "Scanner"),
                GButton(
                  icon: Icons.dataset,
                  text: "Data",
                ),
              ]),
        ),
      ),
    );
  }
}
