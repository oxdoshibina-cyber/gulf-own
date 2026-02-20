import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gulfownsalesview/core/build_config/app_env.dart';
import 'package:gulfownsalesview/core/build_config/build_config.dart';
import 'package:gulfownsalesview/core/constants/api_endpoints.dart';
import 'package:gulfownsalesview/data/shared_pref_helper/shared_pref_helper.dart';
import 'package:gulfownsalesview/presentation/bloc/add_tickets/add_tickets_bloc.dart';
import 'package:gulfownsalesview/presentation/bloc/assign_tickets/assign_tickets_bloc.dart';
import 'package:gulfownsalesview/presentation/bloc/auth/auth_bloc.dart';
import 'package:gulfownsalesview/presentation/bloc/completed_work/completed_work_bloc.dart';
import 'package:gulfownsalesview/presentation/bloc/items_collected/items_collected_bloc.dart';
import 'package:gulfownsalesview/presentation/bloc/notification/notification_bloc.dart';
import 'package:gulfownsalesview/presentation/bloc/qc_checklist/qc_checklist_bloc.dart';
import 'package:gulfownsalesview/presentation/bloc/register_complaint/register_complaint_bloc.dart';
import 'package:gulfownsalesview/presentation/bloc/spare_allocation/spare_allocation_bloc.dart';
import 'package:gulfownsalesview/presentation/bloc/tech_dashboard/tech_dashboard_bloc.dart';
import 'package:gulfownsalesview/presentation/router/page_routes.dart';
import 'package:gulfownsalesview/presentation/screens/launch_decider/launch_decider.dart';
import 'injector/di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize DI
  di.setup();

  String? savedBaseUrl = await SharedPrefHelper.getBaseUrl();
  savedBaseUrl ??= ApiEndpoints.baseUrl;
  await SharedPrefHelper.saveBaseUrl(savedBaseUrl);


  await BuildConfig.initialize(
    environment: AppEnv.developer,
    baseUrl: savedBaseUrl,
    timeOut: const Duration(seconds: 15),
    isDeveloperWindowEnabled: true,
  );

  log("Startup AppToken: ${BuildConfig.appToken}");
  log("Startup UserToken: ${BuildConfig.userToken}");

  await Future.delayed(const Duration(milliseconds: 200));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.getIt.get<NotificationBloc>()),
        BlocProvider(create: (_) => di.getIt.get<AuthBloc>()),
        BlocProvider(create: (_) => di.getIt.get<ItemsCollectedBloc>()),
        BlocProvider(create: (_) => di.getIt.get<RegisterComplaintBloc>()),
        BlocProvider(create: (_) => di.getIt.get<QcChecklistBloc>()),
        BlocProvider(create: (_) => di.getIt.get<AssignTicketsBloc>()),
        BlocProvider(create: (_) => di.getIt.get<AddTicketsBloc>()),
        BlocProvider(create: (_) => di.getIt.get<TechDashboardBloc>()),
        BlocProvider(create: (_) => di.getIt.get<CompletedWorkBloc>()),
        BlocProvider(create: (_) => di.getIt.get<SpareAllocationBloc>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(1512, 982),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Gulf Own Service App",
            themeMode: ThemeMode.light,
            theme: ThemeData.light(),
            getPages: Routes.routes,

            /// Always start here to decide user state
            home: const LaunchDecider(),
          );
        },
      ),
    );
  }
}
