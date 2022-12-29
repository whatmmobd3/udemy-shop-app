import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {Key? key, required this.id, required this.title, required this.imageUrl})
      : super(key: key);

  final String id;
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {},
              color: Colors.orangeAccent),
          trailing: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
              color: Colors.orangeAccent),
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetailScreen.routeName, arguments: id);
          },
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
