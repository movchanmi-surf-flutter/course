import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int incrementTimes = 0;
  int decrementTimes = 0;

  void _incrementCounter() => setState(() {
        _counter++;
        incrementTimes++;
      });
  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--;
      decrementTimes++;
    });
  }

  ThemeData get theme => Theme.of(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: theme.textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _RawFloatButton(
              times: decrementTimes,
              iconData: Icons.remove,
              onTap: _decrementCounter,
            ),
            _RawFloatButton(
              times: incrementTimes,
              iconData: Icons.add,
              onTap: _incrementCounter,
            )
          ],
        ),
      ),
    );
  }
}

/// Плавающая кнопка с метаданными
class _RawFloatButton extends StatelessWidget {
  final int times;
  final IconData iconData;
  final VoidCallback onTap;
  const _RawFloatButton(
      {super.key,
      required this.times,
      required this.iconData,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$times',
        ),
        FloatingActionButton(
          onPressed: onTap,
          child: Icon(iconData),
        )
      ],
    );
  }
}
