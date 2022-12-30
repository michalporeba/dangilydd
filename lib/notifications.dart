import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dangilydd/providers.dart';
import 'package:dangilydd/model.dart';

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

class NotificationsContentView extends StatefulWidget {
  final List<UserNotification> notifications;

  NotificationsContentView({
    required notifications,
    Key? key
  }) : notifications = List.from(notifications), super(key: key);

  @override
  State<NotificationsContentView> createState() => _NotificationsContentViewState();
}

class _NotificationsContentViewState extends State<NotificationsContentView> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    if (widget.notifications.isEmpty) {
      return const Text('There are no updates for you today!');
    }
    return AnimatedList(
        key: _listKey,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        initialItemCount: widget.notifications.length,
        itemBuilder: (context, index, animation) {
          final notification = widget.notifications[index];
            return _buildItem(notification, animation);
          }
    );
  }

  Widget _buildItem(UserNotification notification, Animation<double> animation) {
    return SizeTransition(
        sizeFactor: animation,
        child: NotificationCard(data: notification, onAcknowledge: () {
          final notifications = widget.notifications;

          int removeIndex = notifications.indexOf(notification);
          UserNotification removedItem = notifications.removeAt(removeIndex);

          AnimatedListRemovedItemBuilder builder = (context, animation)
          => _buildItem(removedItem, animation);

          _listKey.currentState?.removeItem(
              removeIndex,
              builder
          );
        },)
    );
  }
}

class NotificationCard extends StatelessWidget {
  final UserNotification data;
  final Function() onAcknowledge;
  const NotificationCard({
    required this.data,
    required this.onAcknowledge,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? buttonStyle = Theme.of(context).textTheme.button?.copyWith(color: Colors.pink);
    Icon icon = const Icon(Icons.message);
    if (data.icon == 'warning') {
      icon = const Icon(Icons.warning);
    }

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: icon,
            minVerticalPadding: 10,
            horizontalTitleGap: 0,
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
                onPressed: onAcknowledge,
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
