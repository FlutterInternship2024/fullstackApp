import 'package:flutter/material.dart';
import 'package:fruitsapp/features/welcomeScreen/controller/auth_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';
import '../widgets/tvalidator.dart';

class PhoneVerificationScreen extends StatelessWidget {
  static const routeName = '/phoneScreen';
  const PhoneVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            //Title
            Text(
              TTexts.signupTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            //Form
            PhoneForm(),
          ],
        ),
      ),
    ));
  }
}

class PhoneForm extends StatefulWidget {
  const PhoneForm({
    super.key,
  });

  @override
  State<PhoneForm> createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  final signupFormKey = GlobalKey<FormState>();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _hidePassword = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _firstnameController,
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                    validator: (value) =>
                        TValidator.validateEmptyText('First Name', value),
                  ),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwInputFields,
                ),
                Expanded(
                  child: TextFormField(
                    controller: _lastnameController,
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                    validator: (value) =>
                        TValidator.validateEmptyText('Last Name', value),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            //UserName

            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            // Phone Number
            TextFormField(
              controller: _phoneController,
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
              validator: (value) => TValidator.validatePhoneNumber(value),
            ),

            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            //Terms&Conditions Checkbox
            //TermsConditions(),

            //Sign Up Button

            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (signupFormKey.currentState!.validate()) {
                      _createUserWithPhone();
                    }
                  },
                  child: Text(
                    TTexts.createAccount,
                    style: GoogleFonts.getFont('Poppins', color: Colors.white),
                  ),
                ))
          ],
        ));
  }

  Future<void> _createUserWithPhone() async {
    setState(() {});
    await AuthServices().getPhoneNumber(
        context: context,
        phoneNumber: '+91' + _phoneController.text.trim(),
        firstName: _firstnameController.text.trim(),
        lastName: _lastnameController.text.trim());
  }
}
