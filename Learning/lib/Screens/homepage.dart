import 'package:changesusingstateless/Providers/authprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Log In'),
        backgroundColor: Colors.cyan[100],
      ),
      body:  
        authProvider.isloading ? 
        Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
            child: const Center(child: CircularProgressIndicator(),)):      
        Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ValueListenableBuilder(
            //     valueListenable: toggle,
            //     builder: (context,value,child){
            //       return SizedBox(
            //         width:350,
            //         child: TextFormField(
            //           obscureText: toggle.value,
            //           obscuringCharacter: '*',
            //           decoration:InputDecoration(
            //               suffix: IconButton(
            //                   onPressed: (){
            //                     toggle.value = !toggle.value;
            //                   },
            //                   icon: Icon(toggle.value ? Icons.visibility_off : Icons.visibility)),
            //               hintText: 'Password'
            //           ),
            //         ),
            //       );
            //     }),


            // ValueListenableBuilder(
            //     valueListenable: _counter,
            //     builder: (context,value,child){
            //       return Text(_counter.value.toString(),style: const TextStyle(fontSize: 45),);
            //     }),

            const SizedBox(height: 20,),
            SizedBox(
              width:350,
              child: TextFormField(
                controller: emailController,
                obscureText: false,
                 decoration:const InputDecoration(
                    hintText: 'E-Mail'
                  ),
              ),
             ),
            const SizedBox(height: 10,),
            SizedBox(
              width:350,
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                obscuringCharacter: '*',
                decoration:const InputDecoration(
                    hintText: 'Password'
                ),
              ),
            ),
            const SizedBox(height: 70,),
            InkWell(
              onTap: (){
                authProvider.Login(emailController.text, passwordController.text);
              },
              child: Container(
                height: 45,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.cyan[100]

                ),
                child: const Center(child: Text('Submit'),),
              ),
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            _counter.value ++;
            print(_counter.value);
          },
          child: const Icon(Icons.add),
      ),
    );
  }
}
