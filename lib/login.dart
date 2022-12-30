import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dangilydd/state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gyda'n gilydd"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text('Who are you?', style: Theme.of(context).textTheme.headline4),
                ),
                const UserButton(name: 'Aneirin', image: '1005'),
                const UserButton(name: 'Branwen', image: '1011'),
                const UserButton(name: 'Caradog', image: '1033'),
                const Spacer(),

              ]
          )
      ),
    );
  }
}

class UserButton extends ConsumerWidget {
  final String name;
  final String image;
  const UserButton({
    required this.name,
    this.image = '1005',
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Material(
          color: Theme.of(context).primaryColor,
          elevation: 8,
          borderRadius: BorderRadius.circular(32),
          child:
            InkWell(
              onTap: () {
                ref.read(appState.notifier).setUser(User(name: name));
                Navigator.pushReplacementNamed(context, '/welcome');
              },
              child: Row(
                  children: [
                    const SizedBox(width: 36),
                    Ink.image(
                      image: NetworkImage('https://picsum.photos/200?image='+image),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                const SizedBox(width: 24),
                Text(name, style: Theme.of(context).textTheme.headline4),
              ]
          ),
        ),
      ),
    );

  }
}

