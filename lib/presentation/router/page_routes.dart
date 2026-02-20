import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as transitions_type;
import 'package:gulfownsalesview/presentation/screens/assign_ticket/assign_ticket_screen.dart';
import 'package:gulfownsalesview/presentation/screens/assign_ticket/technician_assign_ticket_screen.dart';
import 'package:gulfownsalesview/presentation/screens/auth/app_auth/app_auth_screen.dart';
import 'package:gulfownsalesview/presentation/screens/auth/user_auth/user_auth_screen.dart';
import 'package:gulfownsalesview/presentation/screens/completed_works/completed_works_second_screen.dart';
import 'package:gulfownsalesview/presentation/screens/customer_enquiry/customer_enquiry_add_new_query.dart';
import 'package:gulfownsalesview/presentation/screens/customer_enquiry/customer_enquiry_view_screen.dart';
import 'package:gulfownsalesview/presentation/screens/qc_checklist/qc_checklist_screen.dart';
import 'package:gulfownsalesview/presentation/screens/register_complaint/register_complaint_screen.dart';
import 'package:gulfownsalesview/presentation/widgets/navigation_bar.dart';

import '../screens/add_ticket/add_ticket_screen.dart';
import '../screens/delivery/finalsettlement_screen.dart';
import '../screens/items_collected.dart/items_collected_screen.dart';
import '../screens/tech_dashboard/spare_part_screen.dart';

const navigationTransition = transitions_type.Transition.fadeIn;

class Routes {
  static final routes = [
    GetPage(
      name: PageRoutes.appAuthScreen,
      page: () => const AppAuthScreen(),
      transition: navigationTransition,
    ),
    GetPage(
      name: PageRoutes.userAuthScreen,
      page: () => const UserAuthScreen(),
      transition: navigationTransition,
    ),
    GetPage(
      name: PageRoutes.mainPage,
      page: () => const NavigationBar(),
      transition: navigationTransition,
    ),
    GetPage(
      name: PageRoutes.registerComplaintScreen,
      page: () => const RegisterComplaintScreen(),
      transition: navigationTransition,
    ),
    GetPage(
      name: PageRoutes.itemsCollectedScreen,
      page: () => const ItemsCollectedScreen(),
      transition: navigationTransition,
    ),
    GetPage(
      name: PageRoutes.technicianAssignTicketScreen,
      page: () => const TechnicianAssignTicketScreen(),
      transition: navigationTransition,
    ),
    GetPage(
      name: PageRoutes.completedWorkSecondScreen,
      page: () => const CompletedWorkSecondScreen(),
      transition: navigationTransition,
    ),
    GetPage(
      name: PageRoutes.customerEnquiryViewScreen,
      page: () => const CustomerEnquiryViewScreen(),
      transition: navigationTransition,
    ),
    GetPage(
      name: PageRoutes.customerEnquiryAddNewQueryScreen,
      page: () => const CustomerEnquiryAddNewQueryScreen(),
      transition: navigationTransition,
    ),
    GetPage(
      name: PageRoutes.addNewTicketScreen,
      page: () => const AddTicketScreen(),
      transition: navigationTransition,
    ),
    GetPage(
      name: PageRoutes.sparePartsScreen,
      page: () => const SparePartsPage(),
      transition: navigationTransition,
    ),
    GetPage(
      name: PageRoutes.finalSettlementScreen,
      page: () => const FinalSettlementScreen(),
      transition: navigationTransition,
    ),
    GetPage(
      name: PageRoutes.qcChecklistScreen,
      page: () => const QcChecklistScreen(),
      transition: navigationTransition,
    ),
    GetPage(
      name: PageRoutes.assignTicketScreen,
      page: () => const AssignTicketScreen(),
      transition: navigationTransition,
    ),
  ];
}

class PageRoutes {
  static const String appAuthScreen = "/appAuthScreen";
  static const String userAuthScreen = "/userAuthScreen";
  static const String mainPage = "/mainPage";
  static const String registerComplaintScreen = "/registerComplaintScreen";
  static const String itemsCollectedScreen = "/itemsCollectedScreen";
  static const String technicianAssignTicketScreen =
      "/technicianAssignTicketScreen";
  static const String completedWorkSecondScreen = "/completedWorkSecondScreen";
  static const String customerEnquiryViewScreen = "/customerEnquiryViewScreen";
  static const String customerEnquiryAddNewQueryScreen =
      "/customerEnquiryAddNewQueryScreen";
  static const String addNewTicketScreen = "/addNewTicketScreen";

  static const String sparePartsScreen = "/sparePartsScreen";

  static const String finalSettlementScreen = "/finalSettlementScreen";
  static const String qcChecklistScreen = '/qcChecklistScreen';
  static const String assignTicketScreen = '/assignTicketScreen';
}
