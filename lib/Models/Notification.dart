
class NotificationModel{
DateTime time;
String notificationTitle;
String notificationDescription;

NotificationModel({
  required this.time,
  required this.notificationTitle,
  required this.notificationDescription
});
}

List demoNotifications = [
  NotificationModel(time: DateTime(2024, DateTime.january, 5), notificationTitle: '30% Special Discount!', notificationDescription: 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered'),
  NotificationModel(time: DateTime(2023, DateTime.march, 3), notificationTitle: '35% Special Discount!', notificationDescription: 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered'),
  NotificationModel(time: DateTime(2024, DateTime.march, 4), notificationTitle: '50% Special Discount!', notificationDescription: 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered'),
  NotificationModel(time: DateTime(2024, DateTime.march, 4), notificationTitle: '50% Special Discount!', notificationDescription: 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered'),
  NotificationModel(time: DateTime(2024, DateTime.march, 4), notificationTitle: '50% Special Discount!', notificationDescription: 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered'),
];