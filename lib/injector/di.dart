import 'package:get_it/get_it.dart';
import 'package:gulfownsalesview/data/add_tickets/repository_imp/add_tickets_repository_imp.dart';
import 'package:gulfownsalesview/data/assign_tickets/repository_imp/assign_tickets_repository_imp.dart';
import 'package:gulfownsalesview/data/auth/auth_repository_imp/auth_repository_imp.dart';
import 'package:gulfownsalesview/data/items_collected/repository_imp/items_collected_repository_impl.dart';
import 'package:gulfownsalesview/data/qc_checklist/repository_imp/qc_checklist_repository_imp.dart';
import 'package:gulfownsalesview/data/register_complaint/repository_imp/register_complaint_repository_imp.dart';
import 'package:gulfownsalesview/data/spare_allocation/repository_impl/spare_allocation_repository_impl.dart';
import 'package:gulfownsalesview/data/tech_dashboard/repository_imp/technician_dashboard_repository_imp.dart';
import 'package:gulfownsalesview/domain/add_tickets/repository/add_tickets_repository.dart';
import 'package:gulfownsalesview/domain/assign_tickets/repository/assign_tickets_repository.dart';
import 'package:gulfownsalesview/domain/auth/repository/auth_repository.dart';
import 'package:gulfownsalesview/domain/items_collected/repository/items_collected_repository.dart';
import 'package:gulfownsalesview/domain/qc_checklist/repository/qc_checklist_repository.dart';
import 'package:gulfownsalesview/domain/register_complaint/repository/register_complaint_repository.dart';
import 'package:gulfownsalesview/domain/spare_allocation/repository/spare_allocation_repository.dart';
import 'package:gulfownsalesview/domain/tech_dashboard/repository/tech_dashboard_repository.dart';
import 'package:gulfownsalesview/presentation/bloc/add_tickets/add_tickets_bloc.dart';
import 'package:gulfownsalesview/presentation/bloc/assign_tickets/assign_tickets_bloc.dart';
import 'package:gulfownsalesview/presentation/bloc/auth/auth_bloc.dart';
import 'package:gulfownsalesview/presentation/bloc/items_collected/items_collected_bloc.dart';
import 'package:gulfownsalesview/presentation/bloc/notification/notification_bloc.dart';
import 'package:gulfownsalesview/presentation/bloc/qc_checklist/qc_checklist_bloc.dart';
import 'package:gulfownsalesview/presentation/bloc/register_complaint/register_complaint_bloc.dart';
import 'package:gulfownsalesview/presentation/bloc/spare_allocation/spare_allocation_bloc.dart';
import 'package:gulfownsalesview/presentation/bloc/tech_dashboard/tech_dashboard_bloc.dart';

import '../data/completed_works/repository_imp/completed_works_repository_impl.dart';
import '../domain/completed_works/repository/completed_work_repository.dart';
import '../presentation/bloc/completed_work/completed_work_bloc.dart';

final getIt = GetIt.instance;

void setup() {
  //Repository
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImp());
  getIt.registerSingleton<ItemsCollectedRepository>(
    ItemsCollectedRepositoryImpl(),
  );
  getIt.registerSingleton<RegisterComplaintRepository>(
    RegisterComplaintRepositoryImp(),
  );
  getIt.registerSingleton<QcChecklistRepository>(QcChecklistRepositoryImp());
  getIt.registerSingleton<AssignTicketsRepository>(
    AssignTicketsRepositoryImp(),
  );
  getIt.registerSingleton<AddTicketsRepository>(AddTicketsRepositoryImp());
  getIt.registerSingleton<TechDashboardRepository>(
    TechnicianDashboardRepositoryImp(),
  );

  getIt.registerSingleton<CompletedWorkRepository>(
    CompletedWorksRepositoryImpl(),
  );

  getIt.registerSingleton<SpareAllocationRepository>(
    SpareAllocationRepositoryImpl(),
  );

  // --------------------
  // Blocs
  // --------------------

  getIt.registerLazySingleton<NotificationBloc>(() => NotificationBloc());

  getIt.registerSingleton<AuthBloc>(AuthBloc(getIt<AuthRepository>()));
  getIt.registerSingleton<ItemsCollectedBloc>(
    ItemsCollectedBloc(getIt<ItemsCollectedRepository>()),
  );

  getIt.registerSingleton<RegisterComplaintBloc>(
    RegisterComplaintBloc(getIt<RegisterComplaintRepository>()),
  );

  getIt.registerSingleton<QcChecklistBloc>(
    QcChecklistBloc(getIt<QcChecklistRepository>()),
  );

  getIt.registerSingleton<AssignTicketsBloc>(
    AssignTicketsBloc(getIt<AssignTicketsRepository>()),
  );

  getIt.registerSingleton<AddTicketsBloc>(
    AddTicketsBloc(getIt<AddTicketsRepository>()),
  );

  getIt.registerSingleton<TechDashboardBloc>(
    TechDashboardBloc(getIt<TechDashboardRepository>()),
  );
  getIt.registerSingleton<CompletedWorkBloc>(
    CompletedWorkBloc(getIt<CompletedWorkRepository>()),
  );

  getIt.registerSingleton<SpareAllocationBloc>(
    SpareAllocationBloc(getIt<SpareAllocationRepository>()),
  );
}
