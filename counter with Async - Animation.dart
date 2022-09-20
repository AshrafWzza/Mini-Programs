import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter',
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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;
  @override
  void initState() {
    super.initState();
    /*controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 2), upperBound: 100.0);
    controller!.forward();
    controller!.addListener(() {
      setState(() {});
    });
    counter();*/
  }

  /// Counter using Animation
  int? counter2;
  void counterAnimation() {
    controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 2), upperBound: 100.0);
    controller!.forward();
    controller!.addListener(() {
      setState(() {});
    });
  }

  /// Counter using Async
  int? counter1;
  void counterAsync() async {
    for (int i = 0; i <= 100; i++) {
      await Future(() {
        counter1 = i;
      });
    }
  }

  /// Counter using flutter_animate package
  void counterWithPackage(){
    Animate()
                .custom(
                  duration: 10.seconds,
                  begin: 10,
                  end: 0,
                  builder: (_, value, __) => Text(value.round().toString()),
                )
                .fadeOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter using Animation: ${controller?.value.toInt() ?? 0}%'),
            Text('Counter using Async: ${counter1 ?? 0}%'),
            ElevatedButton(
                onPressed: () {
                  counterAsync();
                  counterAnimation();
                },
                child: const Text('Counter'))
          ],
        ),
      ),
    ));
  }
}
