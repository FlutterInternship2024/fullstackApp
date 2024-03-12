import 'package:flutter/material.dart';

import '../../../../widgets/customTextbutton.dart';
import 'infoTile.dart';

class BuildPersonalInfo extends StatelessWidget {
  const BuildPersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Material(
        color: Colors.white,
        elevation: 10,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Column(
          children: [
            BuildInfoTile(
              title: 'Name',
              value: 'user.name',
            ),
            BuildInfoTile(
              title: 'Email',
              value: 'user.email',
            ),
            BuildInfoTile(
              title: 'Phone',
              value: 'user.phoneNumber',
            ),
            CustomTextButton(
              callback: () {},
              buttonTitle: 'Edit My Profile',
            )
          ],
        ),
      ),
    );
  }
}
