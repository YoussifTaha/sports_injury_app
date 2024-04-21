import 'package:sports_injury_app/core/Helpers/cache_helper.dart';
import 'package:sports_injury_app/core/Helpers/extensions.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/routing/routes.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/core/theming/styles_manager.dart';
import 'package:sports_injury_app/features/login/logic/cubit/login_cubit.dart';
import 'package:sports_injury_app/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:sports_injury_app/features/login/ui/widgets/email_field.dart';
import 'package:sports_injury_app/features/login/ui/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:sports_injury_app/core/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(70),
                Text(
                  'Welcome Back',
                  style: getBoldStyle(color: ColorManger.primary, fontSize: 24),
                ),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: getRegularStyle(
                      color: ColorManger.regularGrey,
                      textHeight: 1.2,
                      fontSize: 14),
                ),
                verticalSpace(36),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const EmailField(),
                      const SizedBox(
                        height: 10.0,
                      ),
                      verticalSpace(10),
                      const PasswordField(),
                      verticalSpace(24),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'Forgot Password?',
                          style: getRegularStyle(
                              color: ColorManger.primary, fontSize: 13),
                        ),
                      ),
                      verticalSpace(30),
                      BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state is LoginSuccessState) {
                            context.pushNamedAndRemoveUntill(
                                Routes.postLoginScreen,
                                predicate: (Route<dynamic> route) => false);
                            CacheHelper.saveData(key: 'isLogedIn', value: true);
                          }
                          if (state is LoginErrorState) {
                            showToast(
                                text: state.error, state: ToastStates.error);
                          }
                        },
                        builder: (context, state) {
                          if (state is LoginLoadingState) {
                            return CircularProgressIndicator();
                          } else
                            return button(
                                context: context,
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    LoginCubit.get(context).login();
                                  }
                                },
                                text: 'Login',
                                height: 50,
                                color: ColorManger.primary,
                                fontSize: 16.sp);
                        },
                      ),
                      verticalSpace(30),
                      const AlreadyHaveAccountText(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
