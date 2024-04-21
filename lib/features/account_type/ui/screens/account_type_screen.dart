import 'package:sports_injury_app/core/Helpers/cache_helper.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/core/theming/styles_manager.dart';
import 'package:sports_injury_app/core/widgets/widgets.dart';
import 'package:sports_injury_app/features/account_type/logic/cubit/account_type_cubit.dart';
import 'package:sports_injury_app/features/account_type/ui/widgets/account_type_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountType extends StatefulWidget {
  final String email;
  final String fullName;
  final String phone;
  const AccountType(
      {Key? key,
      required this.email,
      required this.fullName,
      required this.phone})
      : super(key: key);

  @override
  State<AccountType> createState() => _AccountTypeState();
}

String? accountType;

class _AccountTypeState extends State<AccountType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 30.h),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Text(
                'Account Type',
                style: getBoldStyle(
                    color: ColorManger.darkPrimary, fontSize: 24.sp),
              ),
              verticalSpace(10),
              Text(
                'Choose whether you are a Physiotherapist or a Sports patient',
                textAlign: TextAlign.center,
                style: getRegularStyle(
                    color: ColorManger.regularGrey,
                    fontSize: 16.sp,
                    textHeight: 1.4.h),
              ),
              verticalSpace(50),
              BlocConsumer<AccountTypeCubit, AccountTypeState>(
                listener: (context, state) {
                  if (state is CreateUserSuccessState) {
                    AccountTypeCubit.get(context)
                        .navigateBasedOnUserType(context: context);
                  }
                },
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      AccountTypeCubit.get(context)
                          .makeDoctorUserType(accountType: 'userDoctor');
                    },
                    child: const AccountTypeCard(
                      accountType: 'Doctor',
                      accountTypeImagePath: 'assets/images/doctorUser.png',
                      accountTypeTitle: 'Physiotherapist',
                      description:
                          'Help yourself in the evaluation process with \ntools that make you get \nyour patients to their\noptimum recovery.',
                    ),
                  );
                },
              ),
              verticalSpace(25),
              BlocBuilder<AccountTypeCubit, AccountTypeState>(
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      AccountTypeCubit.get(context)
                          .makePatientUserType(accountType: 'userPatient');
                    },
                    child: const AccountTypeCard(
                      accountType: 'Patient',
                      accountTypeImagePath: 'assets/images/patientUser.png',
                      accountTypeTitle: 'Sports Patient',
                      description:
                          'Follow up with your own \nphysiotherapist and keep up\nthe spirit.',
                    ),
                  );
                },
              ),
              verticalSpace(50),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Note: ',
                      style: getBoldStyle(
                        color: ColorManger.darkPrimary,
                        fontSize: 14.sp,
                      ),
                    ),
                    TextSpan(
                      text:
                          'You can’t change the account type once you’ve made it.',
                      style: getRegularStyle(
                          color: ColorManger.regularGrey,
                          fontSize: 14.sp,
                          textHeight: 1.2.h),
                    )
                  ],
                ),
              ),
              verticalSpace(20),
              BlocBuilder<AccountTypeCubit, AccountTypeState>(
                builder: (context, state) {
                  if (state is CreateUserLoadingState) {
                    return CircularProgressIndicator();
                  }
                  return button(
                      context: context,
                      function: () {
                        AccountTypeCubit.get(context).userCreate(
                            email: widget.email,
                            fullName: widget.fullName,
                            phone: widget.phone);

                        CacheHelper.saveData(
                            key: 'isAccountCreated', value: true);
                      },
                      text: 'Create Account');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
