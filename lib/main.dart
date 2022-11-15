import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  // user will give the winning no
  int winning_no = 5;
  Random random = Random();
  int x = 0;
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.teal,
          title: const Text(
            'Lottery App',
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text('Lottery Winning Number is $winning_no'),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 250,
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                    bottom: 10,
                  ),
                  // ternery operator
                  child: x==winning_no ? 
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.done_all_rounded,
                        color: Colors.green,
                        size: 80,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Congratulation you won the lottery and your lottery no. is $x ',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ) 
                  : 
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 80,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Better luck next time your number is $x \ntry again',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          onPressed: () {
            x = random.nextInt(10);
            print(x);
            setState(() {});
          },
          elevation: 10,
          child: const Icon(Icons.refresh, size:40,),
        ),
      ),
    );
  }
}
