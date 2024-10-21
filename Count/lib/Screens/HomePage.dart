import 'package:count/Provider/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final Countprovider = Provider.of<CountProvider>(context,listen: false);
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
            Consumer<CountProvider>(
                builder: (BuildContext context, value, Widget? child) {
                  return Text(Countprovider.count.toString(),style: const TextStyle(fontSize: 35),);
                },
                )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed:(){
            Countprovider.setCount();
            // print('$x');
          },
        child: const Icon(Icons.add),
      ),
    );
  }
}
