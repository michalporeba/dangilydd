import 'package:meta/meta.dart';

@immutable
class UserNotification {
  final String id;
  final String subject;
  final String? icon;
  final String? message;

  const UserNotification({
    required this.id,
    required this.subject,
    this.icon,
    this.message
  });
}