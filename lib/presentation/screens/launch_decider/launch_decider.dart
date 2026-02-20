import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:gulfownsalesview/presentation/bloc/auth/auth_bloc.dart';
import 'package:gulfownsalesview/presentation/router/page_routes.dart';

class LaunchDecider extends StatelessWidget {
  const LaunchDecider({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(CheckLoginStatus());

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        log("LaunchDecider State => $state");

        if (state is ShowAppAuthPage) {
          Get.offAllNamed(PageRoutes.appAuthScreen);
        } 
        else if (state is ShowUserLoginPage) {
          Get.offAllNamed(PageRoutes.userAuthScreen);
        } 
        else if (state is AuthLoggedIn) {
          Get.offAllNamed(PageRoutes.mainPage);
        }
      },
      child: const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
