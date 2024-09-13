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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  bool _isFirstImage = true; // Boolean to toggle between images

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _isFirstImage = true;
    });
  }

  void _toggleImage() {
    setState(() {
      _isFirstImage = !_isFirstImage; // Toggle between images
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 20),
                  // Image display
                  Image.network(
                    _isFirstImage
                        ? 'https://www.att.com/scmsassets/global/devices/phones/apple/apple-iphone-15-pro-max/carousel/natural-titanium-1.png' // First image
                        : 'https://target.scene7.com/is/image/Target/GUEST_e44b2925-0926-4441-af5e-88dc0205df6f?wid=488&hei=488&fmt=pjpeg', // Second image
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _toggleImage,
                    child: const Text('Toggle Image'),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: [
                    FloatingActionButton(
                      onPressed: _decrementCounter,
                      tooltip: 'Decrement',
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: _decrementCounter,
                      child: const Text('Decrement'),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: _resetCounter,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 40.0),
                  ),
                  child: const Text('Reset'),
                ),
                Column(
                  children: [
                    FloatingActionButton(
                      onPressed: _incrementCounter,
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: _incrementCounter,
                      child: const Text('Increment'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
