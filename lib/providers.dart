import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pataiu/model.dart';
import 'state.dart';

final notificationsProvider = FutureProvider<List<UserNotification>>((ref) async {
  User? user = ref.watch(appState).user;

  switch(user?.name) {
    case 'Aneirin': return [];
    case 'Branwen': return const [
      UserNotification(
        id: '1',
        subject: 'Sample Notification',
        message: ''
      )
    ];
    case 'Caradog': return const [
      UserNotification(
          id: '1',
          subject: 'Sample Message',
          message: ''
      ),
      UserNotification(
        id: '2',
        subject: 'Warning Message',
        message: ''
      )
    ];
    default: return [];
  }
});