import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/features/signup/ui/widgets/confirm_password_field.dart';
import 'package:sports_injury_app/features/signup/ui/widgets/email_field.dart';
import 'package:sports_injury_app/features/signup/ui/widgets/full_name_field.dart';
import 'package:sports_injury_app/features/signup/ui/widgets/password_field.dart';
import 'package:sports_injury_app/features/signup/ui/widgets/phone_field.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FullNameField(
          nameController: nameController,
        ),
        verticalSpace(10),
        PhoneField(
          phoneController: phoneController,
        ),
        verticalSpace(10),
        EmailField(
          emailController: emailController,
        ),
        verticalSpace(10),
        PasswordField(
          passwordController: passwordController,
        ),
        verticalSpace(10),
        ConfirmPasswordField(
          passwordController: passwordController,
          secondPasswordController: confirmPasswordController,
        ),
        verticalSpace(40),
      ],
    );
  }
}
