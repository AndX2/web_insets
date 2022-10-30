import 'package:flutter/material.dart';

import 'package:web_insets/web_insets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web_insets Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late WebInsetsListener _listener;

  EdgeInsets _webInsets = EdgeInsets.zero;

  @override
  void initState() {
    super.initState();
    _listener = WebInsetsListener(
      (insets) {
        setState(() {
          _webInsets = insets;
        });
      },
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('WebInsets demo'),
      ),
      bottomNavigationBar: Material(
        elevation: 16.0,
        child: Padding(
          padding: EdgeInsets.only(bottom: _webInsets.bottom),
          child: BottomNavigationBar(
            elevation: 0.0,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.one_k), label: 'one'),
              BottomNavigationBarItem(icon: Icon(Icons.two_k), label: 'second'),
              BottomNavigationBarItem(icon: Icon(Icons.three_k), label: 'third'),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Insets:'),
            Text('left: ${_webInsets.left}'),
            Text('right: ${_webInsets.left}'),
            Text('top: ${_webInsets.top}'),
            Text('bottom: ${_webInsets.bottom}'),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: WebInsets().initializeViewPort,
              child: const Text('Set HTML viewport'),
            )
          ],
        ),
      ),
    );
  }
}
