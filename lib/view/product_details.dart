import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:slash_internship_task/view/reusable_widgets.dart';

import '../classes/product_class.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _currentIndex = 0;
    int carouselIndex = 0;


  @override
  Widget build(BuildContext context) {
    return reusableScaffold(
      _productDetails(_currentIndex),
      'Product details',
      () {
        Navigator.pop(context);
      },
    );
  }

  Widget _productDetails(int currentIndex) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          // Display the product image
          _buildProductImagesCarousel(currentIndex),
          SizedBox(height: 16),
                    _buildMiniImagesRow(),


          // Display other product details using ListView.builder
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.product.variations.length,
            itemBuilder: (context, index) {
              var variation = widget.product.variations[index];
              return ListTile(
                title: Text('Variation ${index + 1}',
                    style: const TextStyle(color: Colors.white)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Price: ${variation.price}',
                        style: const TextStyle(color: Colors.white)),
                    Text('Quantity: ${variation.quantity}',
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
              );
            },
          ),

          // Display mini images row
          SizedBox(height: 16),
        ],
      ),
    );
  }

Widget _buildProductImagesCarousel(int index) {
  final List<NetworkImage> images = [];

  // Ensure that the index is within bounds
  if (index >= 0 && index < widget.product.variations.length) {
    for (var i = 0; i < widget.product.variations[index].productVariantImages.length; i++) {
      images.add(NetworkImage(widget.product.variations[index].productVariantImages[i]));
    }
  }

  return CarouselSlider(
    options: CarouselOptions(
      height: MediaQuery.of(context).size.width * 0.8,
      aspectRatio: 1 / 1,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
      onPageChanged: (newIndex, reason) {
        setState(() {
          carouselIndex = newIndex;
        });
      },
    ),
    items: images.map((image) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      );
    }).toList(),
  );
}

  Widget _buildMiniImagesRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.product.variations[_currentIndex].productVariantImages.length,
        (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                carouselIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.all(8.0),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: carouselIndex == index ? Colors.blue : Colors.grey,
                  width: 2.0,
                ),
              ),
              child: Image.network(
                widget.product.variations[_currentIndex].productVariantImages[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
