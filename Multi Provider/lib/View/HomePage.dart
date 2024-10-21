import 'package:flutter/material.dart';
import 'package:multiprovider/Provider/oneProvider.dart';
import 'package:provider/provider.dart';

import '../Provider/countProvider.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double value = 1.0;
  @override
  Widget build(BuildContext context) {
  final oneProvider = Provider.of<FirstProvider>(context,listen: false);
  final countProvider = Provider.of<CountProvider>(context,listen: false );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi Provider'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[100],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CountProvider>(
              builder: (BuildContext context, value, Widget? child) {
                return Text(countProvider.count.toString(),style: const TextStyle(fontSize: 35),);
              },
            ),


            Consumer<FirstProvider>(
              builder: (BuildContext context, value, Widget? child) {
                return  Slider(
              min: 0,
              max: 1,
              value: value.value,
              onChanged: (newValue){
                print(newValue);
                value.setValue(newValue);
              });
          },),


            const SizedBox(height: 10,),
            Row(
              children: [
                Consumer<FirstProvider>(builder: (context,value,child){
                  return  Expanded(
                      child: Container(
                        height: 110,
                        decoration:BoxDecoration(
                          color: Colors.teal.withOpacity(value.value),
                        ),
                        child: const Center(child:Text('Container 1')),
                      ));
                }),

                Consumer<FirstProvider>(builder: (context,value,child){
                  return  Expanded(
                      child: Container(
                        height: 110,
                        decoration:BoxDecoration(
                          color: Colors.purple.withOpacity(value.value),
                        ),
                        child: const Center(child:Text('Container 2')),
                      ));
                }),
              ],
            ),


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          countProvider.setCount();
          // print('$x');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
