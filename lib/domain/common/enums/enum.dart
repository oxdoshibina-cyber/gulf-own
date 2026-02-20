enum ResponseType {
  active(title: "Active", apiValue: "Active"),
  inActive(title: "Inactive", apiValue: "Inactive"),
  inProgress(title: "In Progress", apiValue: "InProgress"),
  completed(title: "Completed", apiValue: "completed"),
  hold(title: "Hold", apiValue: "Hold"),
  dead(title: "Dead", apiValue: "Dead"),
  pending(title: "Pending", apiValue: "Pending"),
  reject(title: "Rejected", apiValue: "Rejected");

  final String title;
  final String apiValue;
  const ResponseType({required this.title, required this.apiValue});
}
