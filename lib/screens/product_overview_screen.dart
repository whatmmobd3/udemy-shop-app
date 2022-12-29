import 'package:flutter/material.dart';
import 'package:shop_app/widget/products_grid.dart';

import '../providers/products.dart';
import 'package:provider/provider.dart';

enum FilterOptions { favorites, all }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Shop"),
          actions: <Widget>[
            PopupMenuButton(
                onSelected: (FilterOptions selected) {
                  setState(() {
                    if (selected == FilterOptions.favorites) {
                      // productsContainer.showFavoritesOnly();
                      _showFavorites = true;
                    } else {
                      // productsContainer.showAll();
                      _showFavorites = false;
                    }
                  });
                },
                icon: Icon(Icons.more_vert),
                itemBuilder: (_) => [
                      PopupMenuItem(
                        child: Text("Only Favorite"),
                        value: FilterOptions.favorites,
                      ),
                      PopupMenuItem(
                        child: Text("Show All"),
                        value: FilterOptions.all,
                      ),
                    ])
          ],
        ),
        body: ProductsGrid(
          showFavs: _showFavorites,
        ));
  }
}
