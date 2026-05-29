import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlu_students/features/login/cubit/login_cubit.dart';
import 'package:tlu_students/features/login/cubit/login_state.dart';
import 'package:tlu_students/gen/assets.gen.dart';
import 'package:tlu_students/routes.dart';
import 'package:tlu_students/shared/extensions/extensions.dart';
import 'package:tlu_students/shared/utils/validate_form.dart';
import 'package:tlu_students/shared/widgets/app_layout.dart';
import 'package:tlu_students/shared/widgets/app_text.dart';
import 'package:tlu_students/shared/widgets/app_text_form_field.dart';
import 'package:tlu_students/shared/widgets/buttons/app_button.dart';
import 'package:tlu_students/shared/widgets/simple_toastification.dart';
import 'package:tlu_students/features/localization/localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final LoginCubit loginCubit;
  final ValueNotifier<bool> _passwordVisibleNotifier = ValueNotifier(false);

  @override
  void initState() {
    loginCubit = context.read<LoginCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    final height = context.height;

    return AppLayout(
      child: SafeArea(
        child: BlocListener<LoginCubit, LoginState>(
          listener: (_, state) {
            state.error?.whenOrNull(
              data: (error, _) => showErrorToast(error),
            );
            if (state.isLoginSuccess) {
              Navigator.of(context).pushReplacementNamed(RouteName.main);
            }
          },
          child: Form(
            key: formKey,
            child: Column(
              children: [
                // Align(
                //         alignment: Alignment.centerLeft,
                //         child: Container(
                //           padding: const EdgeInsets.symmetric(
                //               horizontal: 13, vertical: 10),
                //           decoration: BoxDecoration(
                //             color: context.colors.white,
                //             borderRadius: BorderRadius.circular(10),
                //             boxShadow: [
                //               BoxShadow(
                //                 color: Colors.grey.withOpacity(0.5),
                //                 spreadRadius: 2,
                //                 blurRadius: 5,
                //                 offset: const Offset(0, 3),
                //               ),
                //             ],
                //           ),
                //           child: InkWell(
                //               onTap: () {}, child: Assets.icons.left.svg()),
                //         ),
                //       ),
                SizedBox(child: Image.asset(Assets.images.TLUintro.path)),
                Expanded(
                  flex: 7,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.06, vertical: height * 0.02),
                      child: Column(
                        children: [
                          AppText(
                            'login.title'.tr(),
                            fontSize: width * 0.07,
                            fontWeight: FontWeight.bold,
                            color: context.colors.black,
                            maxLines: 2,
                            textAlign: TextAlign.start,
                          ),
                          AppText('login.subtitle'.tr(),
                              fontSize: width * 0.035,
                              color: context.colors.black.withOpacity(0.5)),
                          SizedBox(height: height * 0.02),
                          AppTextFormField(
                            autovalidateMode: AutovalidateMode.disabled,
                            validator: (value) {
                              return Validation.validateStudentId(value);
                            },
                            borderRadius: BorderRadius.circular(width * 0.25),
                            hintText: 'login.id_hint'.tr(),
                            onChanged: (value) => loginCubit.setEmail(value),
                            prefixIcon: SizedBox(
                              width: width * 0.05,
                              height: width * 0.05,
                              child: Center(
                                child: Assets.icons.user.svg(
                                  width: width * 0.05,
                                  height: width * 0.05,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          ValueListenableBuilder<bool>(
                            valueListenable: _passwordVisibleNotifier,
                            builder: (context, isOn, _) {
                              return AppTextFormField(
                                autovalidateMode: AutovalidateMode.disabled,
                                validator: (value) {
                                  return Validation.validatePass(value);
                                },
                                prefixIcon: SizedBox(
                                  width: width * 0.05,
                                  height: width * 0.05,
                                  child: Center(
                                    child: Assets.icons.lock.svg(
                                      width: width * 0.05,
                                      height: width * 0.05,
                                    ),
                                  ),
                                ),
                                borderRadius:
                                    BorderRadius.circular(width * 0.25),
                                hintText: 'login.password_hint'.tr(),
                                // validator: (value) {
                                //   return Validation.validatePass(value);
                                // },
                                onChanged: (value) =>
                                    loginCubit.setPassword(value),
                                obscured: !isOn,
                                // onChanged: (value) => loginCubit.setPassword(value),
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
                          SizedBox(height: height * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AppText(
                                'login.forgot_password'.tr(),
                                fontSize: width * 0.035,
                                color: context.colors.black,
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.04),
                          BlocBuilder<LoginCubit, LoginState>(
                              builder: (context, state) {
                            final isValid = state.isValid;
                            final isLogining = state.isLoginning;
                            return AppButton(
                              isLoading: isLogining,
                              label: 'login.login_button'.tr(),
                              radius: BorderRadius.circular(width * 0.25),
                              primaryColor: context.colors.tluRedColor,
                              onPressed: isValid
                                  ? () async {
                                      var valid =
                                          formKey.currentState!.validate();
                                      if (valid) {
                                        loginCubit.login();
                                      }
                                    }
                                  : null,
                            );
                          }),
                          SizedBox(height: height * 0.02),
                          // RichText(
                          //     textAlign: TextAlign.center,
                          //     text: TextSpan(
                          //       text: 'login.create_account_query'.tr(),
                          //       style: TextStyle(
                          //         color: context.colors.black.withOpacity(0.5),
                          //         fontSize: width * 0.04,
                          //       ),
                          //       children: [
                          //         WidgetSpan(
                          //           child: InkWell(
                          //             onTap: () {
                          //               Navigator.pushNamed(
                          //                   context, RouteName.register);
                          //             },
                          //             child: AppText(
                          //               'login.sign_up'.tr(),
                          //               style: TextStyle(
                          //                 color: context.colors.black,
                          //                 fontSize: width * 0.045,
                          //                 fontWeight: FontWeight.bold,
                          //               ),
                          //             ),
                          //           ),
                          //         )
                          //       ],
                          //     )),
                        ],
                      ),
                    ),
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
