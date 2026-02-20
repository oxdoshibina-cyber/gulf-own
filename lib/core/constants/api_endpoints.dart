class ApiEndpoints {
  static const baseUrl = "http://3.109.147.140:3045/";

  //Authentication
  static const String appAuth = "app-auth";
  static const String userAuth = 'user-auth';
  static const String userLocations = 'user-locations';

  //Register Complaint
  static const String insertServiceComplaint = 'insert-service-complaint';
  static const String getServiceComplaintByMobile =
      'get-service-complaint-by-mobile';
  static const String getServiceComplaint = 'get-service-complaint';

  //Customer
  static const String getAllCustomers = 'get-all-customers';

  //Items Collected
  static const String getItemsCollected = 'get-items-collected';
  static const String insertItemsCollected = 'insert-items-collected';
  static const String getServiceCategory = '/get-service-category';
  static const String updateItemsCollected = 'update-items-collected';
  static const String getItemsCollectedById = 'get-items-collected-by-id';
  static String deleteItemsCollected(int id) => '/delete-items-collected/$id';

  //Qc Checklist
  static const String getQclist = '/get-qc-list';
  static const String insertQclist = '/insert-qc-list';
  static const String updateQclist = '/update-qc-list';
  static String getdeleteQclist(int id) => '/delete-qc-list/$id';
  static String getQclistById(int id) => '/get-qc-list-by-id/$id';

  //Assign Tickets
  static const String getTickets = '/get-tickets';
  static const String getTicketById = '/get-tickets-by-id';
  static const String assignTechnician = '/assign-technician';

  //Add Tickets
  static const String getServiceBrand = '/get-service-brand';
  static const String insertTickets = '/insert-ticket';
  static const String getServiceCash = '/get-service-cash';
  static const String getServiceCard = '/get-service-card';
  static const String descriptionList = '/description-list';
  static const String insertDescriptionList = '/insert-description';

  //Completed works
  static const String getTechnician = '/get-technicians';
  static const String getCompletedWorkList = '/completed-works';
  static const String getCompletedWorkDetails = '/completed_works-detailed';
  static const String insertServiceReturn = '/service-return';

  //Spare Allocation
  static const String getSpareRequestList = '/spare-request-list';
  static const String getSpareRequestDetails = '/get-spare-detailed';
  static const String approveSpare = '/approve-spare';
  static const String rejectSpare = '/reject-spare';

  //Technician Dashboard
  static const String technicianDashboard = '/technician-dashboard';
  static const String spareList = '/spare-list';
  static const String sparePartsHistory = '/spare-parts-history';
  static const String updateTechnicianStatus = '/update-technician-status';
  static const String relocateTechnician = '/relocate-technician';
  static const String insertSpare = '/insert-spare';
  static String productDetails(int id) => '/product-details/$id';
}
