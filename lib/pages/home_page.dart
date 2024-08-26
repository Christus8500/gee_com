import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gee_com/services/requsets/requests.dart';
import 'package:gee_com/widgets/store_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: FutureBuilder(
        initialData: const [],
        future: getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error Occured'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CupertinoActivityIndicator(
                animating: true,
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                //! Triple dot is for unpacking
                ...snapshot.data!.map(
                  (e) => StoreItem(
                    title: e['title'].toString(),
                    description: e['description'].toString(),
                    price: "\$ ${e['price']}",
                    rating: (e['rating']! as Map)['rate'].toString(),
                    imageUrl: e['image'].toString(),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
