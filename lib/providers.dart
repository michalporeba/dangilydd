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
        message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ullamcorper tellus in massa laoreet bibendum. Fusce molestie tempor ex, sit amet blandit enim lacinia vitae. Nulla egestas magna vitae velit laoreet scelerisque. Maecenas orci libero, congue sed sem vel, vestibulum lacinia odio. Duis nisi mauris, congue a lectus quis, ullamcorper aliquet elit.'
      )
    ];
    case 'Caradog': return const [
      UserNotification(
          id: '1',
          subject: 'Sample Message',
          message: 'Praesent sagittis, nulla nec fringilla varius, metus enim accumsan tortor, tempus aliquet tortor mi ac nisi. Mauris massa erat, semper ac pharetra id, laoreet ac massa.'
      ),
      UserNotification(
        id: '2',
        subject: 'Warning Message',
        icon: 'warning',
        message: 'Morbi quis porta mi. Etiam vehicula est eu rutrum sollicitudin. Fusce hendrerit nisi vel ipsum finibus porttitor. Maecenas vitae ante et est malesuada ullamcorper. Vestibulum at lorem ac justo suscipit condimentum. Fusce luctus libero imperdiet lectus sollicitudin scelerisque.'
      )
    ];
    default: return [];
  }
});