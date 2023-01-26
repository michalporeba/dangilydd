import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class UserAction {
  String key;

  UserAction({required this.key});
}

final actionsProvider = FutureProvider<List<UserAction>>((ref) async {

  return [
    UserAction(key: 'sample.one'),
    UserAction(key: 'sample.two'),
    UserAction(key: 'sample.three'),
    UserAction(key: 'admin.data')
  ];
});


class ActionsPage extends ConsumerWidget {
  const ActionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actionsFuture = ref.watch(actionsProvider);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text('Actions Page', style: Theme.of(context).textTheme.headlineMedium),
        ),
        Expanded(
          child: actionsFuture.when(
              data: (data) => ActionsView(actions: data),
              error: (_, __) => const Text('error'),
              loading: () => const Text('loading')
          )
        )
      ]
    );
  }
}

class ActionsView extends StatelessWidget {
  final List<UserAction> actions;

  ActionsView({
    required actions,
    Key? key
  }) : actions = List.from(actions), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: actions.map((e) {
        return ActionTile(leading: const Icon(Icons.work_outline_rounded), title: e.key);
      }).toList()
    );
  }
}

class ActionTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final String? subtitle;

  const ActionTile({
    required this.leading,
    required this.title,
    this.subtitle,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: leading,
        title: Text(title),
        subtitle: (subtitle == null) ? null : Text(subtitle!),
        trailing: const Icon(Icons.arrow_forward_rounded),
      ),
    );
  }
}