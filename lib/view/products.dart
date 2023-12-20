import 'package:flutter/material.dart';
import 'package:slash_internship_task/view/reusable_widgets.dart';

import '../classes/product_class.dart';
import '../data_model/data_model.dart';
import 'product_details.dart';

class ViewProducts extends StatefulWidget {
  const ViewProducts({super.key});

  @override
  State<ViewProducts> createState() => _ViewProductsState();
}

class _ViewProductsState extends State<ViewProducts> {
  @override
  Widget build(BuildContext context) {
    return reusableScaffold(_productsGrid(),'Slash.',(){});
  }

  Widget _productsGrid() {
    return FutureBuilder(
      future: DataModel().fetchAllProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data as List<Product>;
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              print('test');
              print('name is ${products}');
              return _productCard(products[index]);
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _productCard(Product product) {
    final size = MediaQuery.of(context).size.width * 0.4;
    print('IMAGE: ${product.variations[0].productVariantImages[0]}');
    return Card(
      color: Colors.transparent,
      child: Column(
        //Product image
        children: [
          _buildProductImage(product, size),
          //Product name
          _buildProductNameRow(product),
          _buildProductPriceRow(product),
        ],
      ),
    );
  }

  _buildProductImage(Product product, size) {
    final image = NetworkImage(product.variations[0].productVariantImages[0]);
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails(product: product,)));

      },
      child: Container(
        
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  _buildProductNameRow(Product product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          '${product.brandName} - ${product.name}',
          style: _detailsTextStyle(),
          textAlign: TextAlign.left,
        ),
        Container(
          height: 30,
          width: 30,
          child: ClipOval(
            child: Image.network(product.brandLogoUrl!),
          ),
        ),
      ],
    );
  }

  _buildProductPriceRow(Product product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'EGP ${product.variations[0].price}',
          style: _detailsTextStyle(),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(color: Colors.white, Icons.favorite_border)),
        IconButton(
            onPressed: () {},
            icon: Icon(color: Colors.grey, Icons.shopping_cart))
      ],
    );
  }

  TextStyle _detailsTextStyle() {
    return const TextStyle(
        fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white);
  }
}
