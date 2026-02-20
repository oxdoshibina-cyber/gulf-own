import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gulfownsalesview/core/assets/asset_resources.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/domain/auth/model/app_auth_req_model.dart';
import 'package:gulfownsalesview/presentation/bloc/auth/auth_bloc.dart';
import 'package:gulfownsalesview/presentation/bloc/notification/notification_bloc.dart';
import 'package:gulfownsalesview/presentation/router/page_routes.dart';
import 'package:gulfownsalesview/presentation/widgets/app_toast.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';
import 'package:gulfownsalesview/presentation/widgets/custom_text_field.dart';
import 'package:gulfownsalesview/presentation/widgets/responsive_svg_icon.dart';
import 'package:gulfownsalesview/util/validation_util.dart';

class AppAuthScreen extends StatefulWidget {
  const AppAuthScreen({super.key});

  @override
  State<AppAuthScreen> createState() => _AppAuthScreenState();
}

class _AppAuthScreenState extends State<AppAuthScreen> {
  final formKeys = GlobalKey<FormState>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _userNameController.text = "";
    _passwordController.text = "";
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    _userNameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotificationBloc, NotificationState>(
      listener: (context, state) {
        if (state.notifications.isNotEmpty) {
          final notification = state.notifications.last;
          AppToast.showToast(context, model: notification);
        }
      },
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AppAuthSuccess) {
            Get.offAllNamed(PageRoutes.userAuthScreen);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: Form(
              key: formKeys,
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500.w, minWidth: 300.w),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 30.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize
                          .min, // 👈 makes container expand based on content
                      children: [
                        SizedBox(
                          height: 140.h,
                          width: 140.w,
                          child: Image.asset(
                            ImageRes.authLogo,
                            fit: BoxFit.contain,
                          ),
                        ),
                        AppSpacing.h16,
                        Text(
                          "LOGIN YOUR ACCOUNT",
                          style: AppTextStyle.kLargeTextStyle(fontSize: 18.sp),
                        ),
                        AppSpacing.h16,
                        CustomTextField(
                          isTextField: true,
                          validatorFunction: ValidationUtil.validation,
                          controller: _userNameController,
                          focusNode: _userNameFocusNode,
                          hintText: "Enter Username",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ResponsiveSvgIcon(
                              asset: SvgRes.userIcon,
                              size: 23.sp,
                            ),
                          ),
                        ),
                        AppSpacing.h16,
                        CustomTextField(
                          isTextField: true,
                          validatorFunction: ValidationUtil.validation,
                          isPassword: true,
                          hintText: "Enter Password",
                          controller: _passwordController,
                          focusNode: _passwordFocusNode,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ResponsiveSvgIcon(
                              asset: SvgRes.passwordIcon,
                              size: 23.sp,
                            ),
                          ),
                        ),
                        AppSpacing.h16,
                        ContainerButton(
                          alignment: Alignment.center,
                          radius: BorderRadius.circular(14.r),
                          onTap: state is AuthLoading
                              ? null
                              : () {
                                  if (formKeys.currentState!.validate()) {
                                    _userNameFocusNode.unfocus();
                                    _passwordFocusNode.unfocus();

                                    final model = AppAuthReqModel(
                                      clientId: _userNameController.text.trim(),
                                      secret: _passwordController.text.trim(),
                                    );

                                    context.read<AuthBloc>().add(
                                      AppAuth(appAuthReqModel: model),
                                    );
                                  }
                                },
                          height: 57.h,
                          text: state is AuthLoading
                              ? "Logging in...."
                              : "Login",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
