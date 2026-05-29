import 'package:flutter/material.dart';
import 'package:tlu_students/gen/assets.gen.dart';
import 'package:tlu_students/shared/extensions/extensions.dart';
import 'package:tlu_students/shared/widgets/app_layout.dart';
import 'package:tlu_students/shared/widgets/app_text.dart';
import 'package:tlu_students/shared/widgets/app_text_form_field.dart';
import 'package:tlu_students/shared/widgets/app_text_icon.dart';
import 'package:tlu_students/shared/widgets/buttons/buttons.dart';
import 'package:tlu_students/features/localization/localizations.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _passwordVisibleNotifier = ValueNotifier(false);
  // final ValueNotifier<bool> _rePasswordVisibleNotifier = ValueNotifier(false);
  final TextEditingController passwordController = TextEditingController();
  // late final SignupCubit signupCubit;

  // @override
  // void initState() {
  //   signupCubit = context.read<SignupCubit>();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    final height = context.height;

    return AppLayout(
      backgroundColor: context.colors.white,
      child: SafeArea(
        child: Form(
          key: formKey,
          // child: BlocListener<SignupCubit, SignupState>(
          //   listener: (context, state) {
          //     state.error?.whenOrNull(
          //       data: (error, _) => showErrorToast(error),
          //     );
          //     if (state.isSignupSuccess) {
          //       showSuccessToast('Đăng ký thành công');

          //       Navigator.of(context).pushReplacementNamed(RouteName.login);
          //     }
          //   },
          child: Column(
            children: [
              Expanded(
                flex: 7,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.06, vertical: height * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 10),
                            decoration: BoxDecoration(
                              color: context.colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Assets.icons.left.svg()),
                          ),
                        ),
                        SizedBox(height: height * 0.05),
                        AppText(
                          'register.title_desc'.tr(),
                          fontSize: width * 0.07,
                          fontWeight: FontWeight.bold,
                          color: context.colors.black,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: height * 0.02),
                        AppText('login.student_id'.tr(),
                            fontSize: width * 0.045,
                            color: context.colors.black),
                        SizedBox(height: height * 0.01),
                        // Full Name Field
                        AppTextFormField(
                          borderRadius: BorderRadius.circular(width * 0.025),
                          // onChanged: (value) =>
                          //     signupCubit.setFullName(value),
                          hintText: 'e.g. A44444',
                          prefixIcon: SizedBox(
                            width: width * 0.05,
                            height: width * 0.05,
                            child: Center(
                              child: Assets.icons.id.svg(
                                width: width * 0.05,
                                height: width * 0.05,
                                color: context.colors.black.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        AppText('register.full_name'.tr(),
                            fontSize: width * 0.045,
                            color: context.colors.black),
                        SizedBox(height: height * 0.01),
                        // Student Code Field
                        AppTextFormField(
                          borderRadius: BorderRadius.circular(width * 0.025),
                          // onChanged: (value) =>
                          //     signupCubit.setStudentCode(value),
                          hintText: 'Enter your legal full name',
                          prefixIcon: SizedBox(
                            width: width * 0.05,
                            height: width * 0.05,
                            child: Center(
                              child: Assets.icons.user.svg(
                                width: width * 0.05,
                                height: width * 0.05,
                                color: context.colors.black.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.02),

                        // Class Name Field

                        AppText('register.email'.tr(),
                            fontSize: width * 0.045,
                            color: context.colors.black),
                        SizedBox(height: height * 0.01),
                        // Faculty Field
                        AppTextFormField(
                          borderRadius: BorderRadius.circular(width * 0.025),
                          // onChanged: (value) => signupCubit.setFaculty(value),
                          hintText: 'yourStudentCode@thanglong.edu.vn',
                          prefixIcon: SizedBox(
                            width: width * 0.05,
                            height: width * 0.05,
                            child: Center(
                              child: Assets.icons.email.svg(
                                width: width * 0.04,
                                height: width * 0.04,
                                color: context.colors.black.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),

                        // Email Field
                        // AppTextFormField(
                        //   borderRadius: BorderRadius.circular(width * 0.025),
                        //   // onChanged: (value) => signupCubit.setEmail(value),
                        //   // validator: (value) {
                        //   //   return Validation.validateEmail(value);
                        //   // },
                        //   hintText: 'Enter Your Email',
                        //   prefixIcon: SizedBox(
                        //     width: width * 0.05,
                        //     height: width * 0.05,
                        //     child: Center(
                        //       child: Assets.icons.email.svg(
                        //         width: width * 0.05,
                        //         height: width * 0.05,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: height * 0.02),
                        AppText('register.create_password'.tr(),
                            fontSize: width * 0.045,
                            color: context.colors.black),
                        SizedBox(height: height * 0.01),
                        // Password Field
                        ValueListenableBuilder<bool>(
                          valueListenable: _passwordVisibleNotifier,
                          builder: (context, isOn, _) {
                            return AppTextFormField(
                              // onChanged: (value) =>
                              //     signupCubit.setPassword(value),
                              prefixIcon: SizedBox(
                                width: width * 0.05,
                                height: width * 0.05,
                                child: Center(
                                  child: Assets.icons.lock.svg(
                                    width: width * 0.05,
                                    height: width * 0.05,
                                    color:
                                        context.colors.black.withOpacity(0.5),
                                  ),
                                ),
                              ),
                              borderRadius:
                                  BorderRadius.circular(width * 0.025),
                              controller: passwordController,
                              hintText: 'register.password_hint'.tr(),
                              // validator: (value) {
                              //   return Validation.validatePass(value);
                              // },
                              obscured: !isOn,
                              suffixIcon: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  _passwordVisibleNotifier.value = !isOn;
                                },
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                      maxWidth: 34, maxHeight: 34),
                                  child: Center(
                                    child: (!isOn
                                            ? Assets.icons.eyeOff
                                            : Assets.icons.eyeOn)
                                        .svg(
                                      width: 18,
                                      color: context.colors.placeholderColor,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        AppTextIcon(
                          'register.privacy_agreement'.tr(),
                          icon: Assets.icons.warn.path,
                          fontSize: width * 0.04,
                          color: context.colors.black.withOpacity(0.5),
                          iconSize: width * 0.06,
                          spacing: 8,
                        ),
                        // Repeat Password Field
                        // ValueListenableBuilder<bool>(
                        //   // valueListenable: _rePasswordVisibleNotifier,
                        //   builder: (context, isOn, _) {
                        //     return AppTextFormField(
                        //       prefixIcon: SizedBox(
                        //         width: width * 0.05,
                        //         height: width * 0.05,
                        //         child: Center(
                        //           child: Assets.icons.lock.svg(
                        //             width: width * 0.05,
                        //             height: width * 0.05,
                        //           ),
                        //         ),
                        //       ),
                        //       borderRadius:
                        //           BorderRadius.circular(width * 0.025),
                        //       hintText: 'Repeat Your Password',
                        //       obscured: !isOn,
                        //       validator: (value) {
                        //         return Validation.validateRePass(
                        //             value, passwordController.text);
                        //       },
                        //       suffixIcon: GestureDetector(
                        //         behavior: HitTestBehavior.translucent,
                        //         onTap: () {
                        //           _rePasswordVisibleNotifier.value = !isOn;
                        //         },
                        //         child: ConstrainedBox(
                        //           constraints: const BoxConstraints(
                        //               maxWidth: 34, maxHeight: 34),
                        //           child: Center(
                        //             child: (!isOn
                        //                     ? Assets.icons.eyeOff
                        //                     : Assets.icons.eyeOn)
                        //                 .svg(
                        //               width: 18,
                        //               color: context.colors.placeholderColor,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     );
                        //   },
                        // ),
                        SizedBox(height: height * 0.04),

                        // Register Button
                        // BlocBuilder<SignupCubit, SignupState>(
                        //     builder: (context, state) {
                        //   final isValid = state.isValid;
                        //   return AppButton(
                        //       label: 'Register',
                        //       radius: BorderRadius.circular(width * 0.025),
                        //       primaryColor: context.colors.black,
                        //       onPressed: () {
                        //         var valid = formKey.currentState!.validate();
                        //         if (valid) {
                        //           signupCubit.register();
                        //         }
                        //       });
                        // }),
                        SizedBox(height: height * 0.02),

                        // Sign In Link

                        SizedBox(height: height * 0.03),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: context.colors.divider,
                height: 1,
              ),
              SizedBox(height: height * 0.02),
              // AppText(
              //   'Continue with Accounts',
              //   fontSize: width * 0.04,
              //   color: context.colors.black.withOpacity(0.5),
              // ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: AppButton(
                    label: 'register.create_button'.tr(),
                    onPressed: () {},
                    primaryColor: context.colors.tluBlueColor,
                    radius: BorderRadius.circular(width * 0.025)),
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     IconButton(
              //       onPressed: () {},
              //       icon: Assets.icons.google.svg(
              //         width: width * 0.09,
              //         height: width * 0.09,
              //       ),
              //     ),
              //     SizedBox(width: width * 0.08),
              //     IconButton(
              //       onPressed: () {},
              //       icon: Assets.icons.team.svg(
              //         width: width * 0.1,
              //         height: width * 0.1,
              //       ),
              //     ),
              //   ],
              // ),

              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'register.already_have_account'.tr(),
                    style: TextStyle(
                      color: context.colors.black.withOpacity(0.5),
                      fontSize: width * 0.04,
                    ),
                    children: [
                      WidgetSpan(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: AppText(
                            'login.login_button'.tr(),
                            style: TextStyle(
                              color: context.colors.tluRedColor,
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
