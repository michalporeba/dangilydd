import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'notifications.dart';
import 'state.dart';
import 'actions.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("'da'n gilydd app"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Consumer(builder: (context, ref, _) {
                  User? user = ref.watch(appState).user;
                  return Text('Hi, ${user?.name ?? ''}', style: Theme.of(context).textTheme.headlineMedium);
                }),
              ),
              const NotificationsView(),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: ElevatedButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('Hello', style: Theme.of(context).textTheme.headlineMedium),
                    )
                ),
              )
            ]
          )
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text('Your upcoming events', style: Theme.of(context).textTheme.headlineSmall),
              ),
              const EventTile(
                leading: EventLogo(text: 'HP'),
                title: 'Wednesday Help Point',
                subtitle: '5/1/22 - 20:00 to 04:00\nPTA on HK105'
              ),
              const EventTile(
                  leading: EventLogo(text: 'T'),
                  title: 'Thursday Training in Division',
                  subtitle: '6/1/22 - 19:00 to 21:00\nScenarios'
              ),
              const EventTile(
                  leading: EventLogo(text: 'HP'),
                  title: 'Wednesday Help Point',
                  subtitle: '8/1/22 - 20:00 to 04:00\nPTA on HK102'
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Sign up for more', style: Theme.of(context).textTheme.headlineSmall),
              ),
              const EventTile(
                  leading: EventLogo(text: 'HP', color: Colors.black38),
                  title: 'Help Points',
                  subtitle: 'multiple dates - 20:00 to 04:00\nmultiple roles available'
              ),
              const EventTile(
                  leading: EventLogo(text: 'T', color: Colors.black38),
                  title: 'Training: Assisting HCP',
                  subtitle: '12/2/22 in Swansea Training Centre\n5places remaining'
              ),
              const EventTile(
                  leading: EventLogo(text: 'T', color: Colors.black38),
                  title: 'Online CPD: Hypothermia',
                  subtitle: '23/2/22 - 20:30 on Teams'
              ),
              const Spacer(),
            ]
        )
    );
  }
}

class EventLogo extends StatelessWidget {
  final Color color;
  final String text;

  const EventLogo({
    required this.text,
    Color? color,
    Key? key
  }) : color = color ?? Colors.purple, super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
      child: Text(text),
    );
  }
}


class EventTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final String? subtitle;

  const EventTile({
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
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}


class ResourcesPage extends StatelessWidget {
  const ResourcesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text('Resources Page', style: Theme.of(context).textTheme.headlineMedium),
              ),
              const Spacer(),
            ]
        )
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 1);
    return Scaffold(
      appBar: AppBar(title: const Text("'da'n gilydd app"),
        leading: GestureDetector(
          onTap: () { /* Write listener code here */ },
          child: const Icon(
            Icons.menu,  // add custom icons also
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () { Navigator.pushReplacementNamed(context, '/login'); },
                child: const Icon(
                    Icons.logout
                ),
              )
          ),
        ],
      ),
      body: PageView(
          controller: controller,
          children: const <Widget>[
            ActionsPage(),
            HomePage(),
            ResourcesPage()
          ]
      ),
    );
  }
}
