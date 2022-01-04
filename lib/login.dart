import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                  child: Text('Login Page', style: Theme.of(context).textTheme.headline4),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: ElevatedButton(
                      onPressed: () => Navigator.pushReplacementNamed(context, '/welcome'),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text('Sign in', style: Theme.of(context).textTheme.headline5),
                      )
                  ),
                )
              ]
          )
      ),
    );
  }
}
