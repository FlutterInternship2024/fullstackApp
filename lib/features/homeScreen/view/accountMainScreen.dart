import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
                    title: 'Edit Profile',
                    icon: Iconsax.personalcard,
                    callback: () {
                      Navigator.pushNamed(context, EditProfilePage.routeName);
                    },
                  ),
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

class EditProfilePage extends StatefulWidget {
  static const routeName = '/editProfile';
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  void _showCalendar() {
    Alert(
        context: context,
        title: "Select Date of Birth",
        content: SizedBox(
          width: 300,
          height: 400,
          child: SfDateRangePicker(
            onSelectionChanged: _onSelectionChanged,
            selectionMode: DateRangePickerSelectionMode.single,
            initialSelectedRange: PickerDateRange(
                DateTime.now().subtract(const Duration(days: 4)),
                DateTime.now().add(const Duration(days: 3))),
          ),
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Select",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  String _range = '';
  String year = '';
  String month = '';
  String day = '';
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is DateTime) {
        DateTime selectedDateTime = args.value;
        year = selectedDateTime.year.toString();
        month = selectedDateTime.month.toString();
        day = selectedDateTime.day.toString();
      } else if (args.value is List<DateTime>) {
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProfileImageEditButton(),
                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aditya K',
                        style: GoogleFonts.getFont('Poppins',
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      Text(
                        'reachadikush@gmail.com',
                        style: GoogleFonts.getFont('Poppins', fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
          TextField(
            decoration: InputDecoration(hintText: 'reachadikush@gmail.com'),
          ),
          TextButton(
              onPressed: () {
                _showCalendar();
              },
              child: Text('Edit your dob')),
          Text('date :$day'),
          Text('month :$month'),
          Text('year :$year'),
        ],
      ),
    );
  }
}

Stack _buildProfileImageEditButton() {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.lightGreen, width: 2),
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
      Positioned(
          bottom: 0,
          right: 5,
          child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.lightGreen,
              child: GestureDetector(
                child: Icon(
                  Iconsax.edit,
                  size: 20,
                  color: Colors.white,
                ),
                onTap: () {},
              )))
    ],
  );
}
