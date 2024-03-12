import 'package:flutter/material.dart';
import 'package:fruitsapp/features/homeScreen/view/homeMainScreen.dart';
import 'package:fruitsapp/features/welcomeScreen/controller/auth_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';
import '../widgets/tvalidator.dart';

class SignupScreen extends StatelessWidget {
  static const routeName = '/signup';
  const SignupScreen({Key? key}) : super(key: key);

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
            SignupForm(),
          ],
        ),
      ),
    ));
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
  });

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final signupFormKey = GlobalKey<FormState>();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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

            // Email
            TextFormField(
                controller: _emailController,
                expands: false,
                decoration: const InputDecoration(
                    labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
                validator: (value) => TValidator.validateEmail(value)),
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

            // Password
            TextFormField(
              controller: _passwordController,
              expands: false,
              obscureText: _hidePassword,
              decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => setState(() {
                      _hidePassword = !_hidePassword;
                    }),
                    icon: Icon(_hidePassword ? Iconsax.eye_slash : Iconsax.eye),
                  )),
              validator: (value) => TValidator.validatePassword(value),
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
                      _signUpUser();
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

  void _signUpUser() async {
    await AuthServices().createUser(
        context: context,
        firstName: _firstnameController.text.trim(),
        lastName: _lastnameController.text.trim(),
        email: _emailController.text.trim(),
        phoneNumber: _phoneController.text.trim(),
        password: _passwordController.text.trim());
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}
