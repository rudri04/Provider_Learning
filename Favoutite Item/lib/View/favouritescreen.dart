import 'package:favoutiteitems/Provider/favitemprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteItem>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: provider.items.length,
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
