import 'package:flutter/material.dart';
import 'package:fruitsapp/features/welcomeScreen/controller/auth_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';
import '../widgets/tvalidator.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Title
            Text(
              TTexts.loginTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            //Form
            LoginForm(),
          ],
        ),
      ),
    ));
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  final loginFormKey = GlobalKey<FormState>();
  bool _hidePassword = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
          key: loginFormKey,
          child: Column(
            children: [
              // Email
              TextFormField(
                  controller: _emailController,
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.email,
                      prefixIcon: Icon(Iconsax.direct)),
                  validator: (value) => TValidator.validateEmail(value)),
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
                      icon:
                          Icon(_hidePassword ? Iconsax.eye_slash : Iconsax.eye),
                    )),
                validator: (value) => TValidator.validatePassword(value),
              ),

              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),

              //Terms&Conditions Checkbox
              //TermsConditions(),

              //Sign Up Button

              (_isLoading)
                  ? Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: TColors.primary,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                          child: const CircularProgressIndicator(
                              color: TColors.textWhite)),
                    )
                  : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (loginFormKey.currentState!.validate()) {
                            _loginUser();
                          }
                        },
                        child: Text(
                          TTexts.signIn,
                          style: GoogleFonts.getFont('Poppins',
                              color: Colors.white),
                        ),
                      ))
            ],
          )),
    );
  }

  void _loginUser() async {
    setState(() {
      _isLoading = true;
    });
    await AuthServices().loginUser(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        context: context);
    setState(() {
      _isLoading = false;
    });
  }
}
