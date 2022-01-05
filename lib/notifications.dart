import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pataiu/providers.dart';
import 'package:pataiu/model.dart';

class NotificationsView extends ConsumerWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsFuture = ref.watch(notificationsProvider);

    return notificationsFuture.when(
        data: (data) => NotificationsContentView(notifications: data),
        error: (_, __) => const Text('error'),
        loading: () => const Text('loading')
    );
  }
}

class NotificationsContentView extends StatelessWidget {
  final List<UserNotification> notifications;
  const NotificationsContentView({
    required this.notifications,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (notifications.isEmpty) {
      return const Text('There are no updates for you today!');
    }
    return Column(
      children: notifications.map((e) => NotificationCard(data: e)).toList()
    );
  }
}

class NotificationCard extends StatelessWidget {
  final UserNotification data;
  const NotificationCard({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? buttonStyle = Theme.of(context).textTheme.button?.copyWith(color: Colors.pink);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.album),
            title: Text(data.subject, style: Theme.of(context).textTheme.headline5),
            subtitle: Text(data.message ?? '', style: Theme.of(context).textTheme.bodyText1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: Text('Later', style: buttonStyle),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
              TextButton(
                child: Text('Acknowledge', style: buttonStyle),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
