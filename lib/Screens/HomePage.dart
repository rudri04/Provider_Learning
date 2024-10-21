import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int x= 0;

  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Tutorial'),
        backgroundColor: Colors.deepPurple[100],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(x.toString(),style: const TextStyle(fontSize: 35),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed:(){
            setState(() {
              x++;
            });
            print('$x');
          },
        child: const Icon(Icons.add),
      ),
    );
  }
}
