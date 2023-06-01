import 'package:device_signal/screens/home.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('No route'),
                centerTitle: true,
              ),
              body: const Center(
                child: Text(
                  'Sorry no route was found',
                  style: TextStyle(color: Colors.red, fontSize: 18),
                ),
              ),
            ));
  }
}
