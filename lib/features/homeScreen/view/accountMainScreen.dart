import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruitsapp/features/homeScreen/view/profilePage.dart';
import 'package:fruitsapp/features/welcomeScreen/view/welcomeMainScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.lightGreen, width: 4),
                // This sets the radius to make it a circle
                color: Colors.white, // Background color of the oval
              ),
              child: ClipOval(
                child: Image.network(
                  'https://cdn.pixabay.com/photo/2012/04/13/21/07/user-33638_640.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Aditya K',
              style: GoogleFonts.getFont('Poppins',
                  fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.lightGreen, width: 2.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Iconsax.personalcard, color: Colors.white),
                  SizedBox(width: 10.0),
                  Text(
                    'Edit Profile',
                    style: GoogleFonts.getFont('Poppins',
                        fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // BuildPersonalInfo(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: Material(
              color: Colors.white,
              elevation: 10,
              borderRadius: BorderRadius.all(Radius.circular(25)),
              child: Column(
                children: [
                  BuildAccountTile(
                    title: 'Settings',
                    icon: Iconsax.setting,
                    callback: () {},
                  ),
                  BuildAccountTile(
                    title: 'Help',
                    icon: Iconsax.message_question,
                    callback: () {},
                  ),
                  BuildAccountTile(
                    title: 'Privacy Policy',
                    icon: Iconsax.document,
                    callback: () {},
                  ),
                  BuildAccountTile(
                    title: 'Log Out',
                    icon: Iconsax.logout,
                    callback: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                        return WelcomeScreen();
                      }), (route) => false);
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Invite Friends',
                style: GoogleFonts.getFont('Poppins',
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all(Size(double.infinity, 45)),
                backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        12.0), // Set your desired border radius here
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class BuildAccountTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback callback;
  const BuildAccountTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: callback,
        child: ListTile(
          trailing: Icon(Iconsax.arrow_right),
          title: Text(
            title,
            style: GoogleFonts.getFont('Poppins', fontSize: 20),
          ),
          leading: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(12)),
            child: Icon(
              icon,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
