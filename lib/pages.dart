import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'notifications.dart';
import 'state.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PATAIU'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Consumer(builder: (context, ref, _) {
                  User? user = ref.watch(appState).user;
                  return Text('Hi, ${user?.name ?? ''}', style: Theme.of(context).textTheme.headline4);
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
                      child: Text('Hello', style: Theme.of(context).textTheme.headline4),
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
                padding: const EdgeInsets.all(32.0),
                child: Text('Home Page', style: Theme.of(context).textTheme.headline4),
              ),
              const Spacer(),
            ]
        )
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
                child: Text('Resources Page', style: Theme.of(context).textTheme.headline4),
              ),
              const Spacer(),
            ]
        )
    );
  }
}

class ActionsPage extends StatelessWidget {
  const ActionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text('Actions Page', style: Theme.of(context).textTheme.headline4),
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
      appBar: AppBar(title: const Text('PATAIU'),
        leading: GestureDetector(
          onTap: () { /* Write listener code here */ },
          child: const Icon(
            Icons.menu,  // add custom icons also
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
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
