import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gulfownsalesview/core/assets/asset_resources.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/domain/auth/model/user_auth_req_model.dart';
import 'package:gulfownsalesview/presentation/bloc/auth/auth_bloc.dart';
import 'package:gulfownsalesview/presentation/bloc/notification/notification_bloc.dart';
import 'package:gulfownsalesview/presentation/router/page_routes.dart';
import 'package:gulfownsalesview/presentation/widgets/app_toast.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';
import 'package:gulfownsalesview/presentation/widgets/custom_text_field.dart';
import 'package:gulfownsalesview/presentation/widgets/responsive_svg_icon.dart';
import 'package:gulfownsalesview/util/validation_util.dart';

class UserAuthScreen extends StatefulWidget {
  const UserAuthScreen({super.key});

  @override
  State<UserAuthScreen> createState() => _UserAuthScreenState();
}

class _UserAuthScreenState extends State<UserAuthScreen> {
  final formKeys = GlobalKey<FormState>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  final ValueNotifier<String?> selectedBranch = ValueNotifier(null);
  String? selectedBranchId;

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(GetBranchesEvent());
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    _userNameFocusNode.dispose();
    _passwordFocusNode.dispose();
    selectedBranch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UserAuthSuccess) {
          Get.offAllNamed(PageRoutes.mainPage);
        }
      },
      child: BlocConsumer<NotificationBloc, NotificationState>(
        listener: (context, notiState) {
          if (notiState.notifications.isNotEmpty) {
            final notification = notiState.notifications.last;
            AppToast.showToast(context, model: notification);
          }
        },
        builder: (context, _) {
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
                      mainAxisSize: MainAxisSize.min,
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

                        /// Username
                        CustomTextField(
                          isTextField: true,
                          controller: _userNameController,
                          focusNode: _userNameFocusNode,
                          validatorFunction: ValidationUtil.validation,
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

                        /// Password
                        CustomTextField(
                          isTextField: true,
                          isPassword: true,
                          validatorFunction: ValidationUtil.validation,
                          controller: _passwordController,
                          focusNode: _passwordFocusNode,
                          hintText: "Enter Password",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ResponsiveSvgIcon(
                              asset: SvgRes.passwordIcon,
                              size: 23.sp,
                            ),
                          ),
                        ),

                        AppSpacing.h16,

                        /// Branch Dropdown
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            if (state is AuthLoading) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ),
                              );
                            }

                            if (state is BranchesLoadedState) {
                              final model = state.locationModel;

                              final branchNames = model.loactions
                                  .map((e) => e.glname)
                                  .toList(); // <-- ONLY list of strings

                              return ValueListenableBuilder<String?>(
                                valueListenable: selectedBranch,
                                builder: (_, value, __) {
                                  return CustomTextField<String>(
                                    isTextField: false,
                                    validatorFunction:
                                        ValidationUtil.validation,
                                    items: branchNames,
                                    selectedValue: value,
                                    valueNotifier: selectedBranch,
                                    dropDownHintText: "Select Branch",
                                    fillColor: AppColors.whiteColor,
                                    onChanged: (val) {
                                      selectedBranch.value = val;

                                      if (val != null) {
                                        selectedBranchId = model.loactions
                                            .firstWhere((e) => e.glname == val)
                                            .glid;
                                      }
                                    },

                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: ResponsiveSvgIcon(
                                        asset: SvgRes.branchIcon,
                                        size: 23.sp,
                                      ),
                                    ),
                                  );
                                },
                              );
                            }

                            return const Text(
                              "Loading branches...",
                              style: TextStyle(color: Colors.grey),
                            );
                          },
                        ),

                        AppSpacing.h16,

                        /// Login Button
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return ContainerButton(
                              alignment: Alignment.center,
                              radius: BorderRadius.circular(14.r),
                              onTap: state is AuthLoading
                                  ? null
                                  : () {
                                      if (selectedBranchId == null) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              "Please select a branch",
                                            ),
                                            backgroundColor: Colors.red,
                                            behavior: SnackBarBehavior.floating,
                                          ),
                                        );
                                        return;
                                      }
                                      if (formKeys.currentState!.validate()) {
                                        _userNameFocusNode.unfocus();
                                        _passwordFocusNode.unfocus();
                                        final model = UserAuthReqModel(
                                          userName: _userNameController.text
                                              .trim(),
                                          password: _passwordController.text
                                              .trim(),
                                          location: selectedBranchId!,
                                        );

                                        context.read<AuthBloc>().add(
                                          UserAuth(userAuthReqModel: model),
                                        );
                                      }
                                    },
                              height: 57.h,
                              text: state is AuthLoading
                                  ? "Logging in...."
                                  : "Login",
                            );
                          },
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
