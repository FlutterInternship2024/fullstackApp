import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
  String year = '03';
  String month = '12';
  String day = '24';
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      'Email',
                      style: GoogleFonts.getFont('Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'reachadikush@gmail.com',
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  _showCalendar();
                },
                child: Text(
                  'Edit your dob',
                  style: GoogleFonts.getFont('Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$day\/',
                    style: GoogleFonts.getFont('Poppins',
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$month\/',
                    style: GoogleFonts.getFont('Poppins',
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$year',
                    style: GoogleFonts.getFont('Poppins',
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Phone Number
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Phone Number',
                          style: GoogleFonts.getFont('Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            hintText: '+1234567890',
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            prefixIcon: Icon(Icons.phone),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Name
                    Column(
                      children: [
                        Text(
                          'Name',
                          style: GoogleFonts.getFont('Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'John Doe',
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
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
