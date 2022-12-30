import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dangilydd/pages.dart';
import 'package:dangilydd/login.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PARAIU',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/welcome': (context) => const WelcomePage(),
        '/': (context) => const MainPage()
      },
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('to be continued ...', style: Theme.of(context).textTheme.headline4)
      ),
    );
  }
}