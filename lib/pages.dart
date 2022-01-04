import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PATAIU')),
      body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text('Welcome Page', style: Theme.of(context).textTheme.headline4),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: ElevatedButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Hello', style: Theme.of(context).textTheme.headline5),
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
    return Scaffold(
      appBar: AppBar(title: const Text('PATAIU'),
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
      body: Center(
          child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text('Home Page', style: Theme.of(context).textTheme.headline4),
                ),
                const Spacer(),
              ]
          )
      ),
    );
  }
}

class ResourcesPage extends StatelessWidget {
  const ResourcesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PATAIU')),
      body: Center(
          child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text('Resources Page', style: Theme.of(context).textTheme.headline4),
                ),
                const Spacer(),
              ]
          )
      ),
    );
  }
}

class ActionsPage extends StatelessWidget {
  const ActionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PATAIU')),
      body: Center(
          child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text('Actions Page', style: Theme.of(context).textTheme.headline4),
                ),
                const Spacer(),
              ]
          )
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 1);
    return PageView(
      controller: controller,
      children: const <Widget>[
        ActionsPage(),
        HomePage(),
        ResourcesPage()
      ]
    );
  }
}
