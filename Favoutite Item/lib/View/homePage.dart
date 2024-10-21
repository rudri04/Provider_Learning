import 'package:favoutiteitems/Provider/favitemprovider.dart';
import 'package:favoutiteitems/View/darktheme.dart';
import 'package:favoutiteitems/View/favouritescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> selectedItems = [];
  @override
  Widget build(BuildContext context) {
  // final provider = Provider.of<FavouriteItem>(context);
    print('?????');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const FavouriteScreen()));
            },
            icon: const Icon(Icons.favorite,size: 30,)),
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const DarkThemeScreen()));
              },
              icon: const Icon(Icons.thunderstorm,size: 30,)),
        ],
        backgroundColor: Colors.purple[100],
      ),
      body: Center(
        child: Column(
          children: [
            
            Expanded(
              child: ListView.builder(
                itemCount: 50,
                  itemBuilder: (context,index){
                    return Consumer<FavouriteItem>(builder: (context,value,child){
                      return ListTile(
                        onTap: (){
                          if(value.items.contains(index)){
                            value.removeItems(index);
                          }
                          else {
                          value.addItems(index);
                          }
                        },
                        title: Text('Items ${index + 1}'),
                        trailing: value.items.contains(index)? const Icon(Icons.favorite) : const Icon(Icons.favorite_border_outlined),
                        leading: const Icon(Icons.list),
                      );
                    });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
