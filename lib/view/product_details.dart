
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:slash_internship_task/classes/available_properties_class.dart';
import 'package:slash_internship_task/classes/product_variation_class.dart';
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
  CarouselController _carouselController = CarouselController();
  Map<String, List<String>> _properties = {};
  bool _isExpandedValue = false;
  late ProductVariation productVariation;
  late List<AvailableProperties> _availableProperties;
  @override
  void initState() {
    int id = widget.product.variations[0].id;
    productVariation =
        widget.product.variations.firstWhere((element) => element.id == id);
    _availableProperties = widget.product.availableProperties;

    for (var i = 0; i < widget.product.availableProperties.length; i++) {
      List<String> _values = [];
      for (var j = 0;
          j < widget.product.availableProperties[i].values.length;
          j++) {
        _values.add(widget.product.availableProperties[i].values[j].value);
      }
      _properties[widget.product.availableProperties[i].property] = _values;
    }
    super.initState();
  }

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
          _buildFullCarousel(currentIndex),
          const SizedBox(height: 16),
          _displayNameRow(),
          const SizedBox(height: 16),
          _displayPriceRow(),
          const SizedBox(height: 16),

          _properties['Color'] != null
              ? _buildColorRow(_properties['Color']!)
              : Container(),
          _properties['Size'] != null ? _buildSizeDetails() : Container(),

          _properties['Materials'] != null
              ? _buildMaterialDetails()
              : Container(),

          const SizedBox(height: 16),
          _displayDescriptionExpansionPanel(),

          // Display other product details using ListView.builder

          // Display mini images row
        ],
      ),
    );
  }

  Widget _displayNameRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.product.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 50,
          width: 50,
          child: ClipOval(
            child: Image.network(widget.product.brandLogoUrl!),
          ),
        ),
      ],
    );
  }

  _displayPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'EGP ${productVariation.price}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        Text(
          widget.product.brandName!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget _buildSizeDetails() {
    List<String> size = productVariation.productPropertiesValues
        .where((propertyValue) => propertyValue.property == 'Size')
        .map((propertyValue) => propertyValue.value)
        .toList();

    return SizedBox(
      height: 100,
      child: Column(
        children: [
         const  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Select Size',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              Text('Size Chart'),
            ],
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return ElevatedButton(
                  child: Text(size[index]),
                  onPressed: () {
                    setState(() {
                      AvailableProperties sizeProperty =
                          widget.product.availableProperties.firstWhere(
                        (property) => property.property == "Size",
                        orElse: () =>
                            AvailableProperties(property: "", values: []),
                      );
                      PropertyValue sizePropertyValue =
                          sizeProperty.values.firstWhere(
                        (value) => value.value == size[index],
                        orElse: () => PropertyValue(
                            value: "", id: -1), // Default values if not found
                      );

                      int sizeId = sizePropertyValue.id;

                      productVariation = widget.product.variations.firstWhere(
                        (variation) => variation.id == sizeId,
                      );
                    });
                  },
                );
              }),
              itemCount: size.length,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFullCarousel(index) {
    final List<NetworkImage> images = [];

    // Ensure that the index is within bounds
    if (index >= 0 && index < widget.product.variations.length) {
      for (var i = 0; i < productVariation.productVariantImages.length; i++) {
        images.add(NetworkImage(productVariation.productVariantImages[i]));
      }
    }
    return Column(
      children: [
        _buildProductImagesCarousel(images),
        const SizedBox(height: 16),
        Center(child: _buildMiniImagesRow(images)),
      ],
    );
  }

  Widget _buildProductImagesCarousel(List<NetworkImage> images) {
    return CarouselSlider(
      carouselController: _carouselController,
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
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: const BoxDecoration(
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

  Widget _buildMiniImagesRow(List<NetworkImage> images) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  carouselIndex = index;
                  _carouselController.animateToPage(carouselIndex);
                });
              },
              child: Container(
                margin: const EdgeInsets.all(8.0),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: carouselIndex == index ? Colors.blue : Colors.grey,
                    width: 2.0,
                  ),
                ),
                child: Image(
                  image: images[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          itemCount: images.length),
    );
  }

  Widget _buildColorRow(List<String> colors) {
    colors = colors.toSet().toList();

    return Container(
      alignment: AlignmentDirectional.center,
      height: 50,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          String color = 'FF${colors[index]}';
          color = color.replaceAll('#', '');

          return GestureDetector(
            onTap: () {
              setState(() {
                AvailableProperties colorProperty =
                    widget.product.availableProperties.firstWhere(
                  (property) => property.property == "Color",
                  orElse: () => AvailableProperties(property: "", values: []),
                );

                // Find the PropertyValue instance with the given color value
                PropertyValue colorPropertyValue =
                    colorProperty.values.firstWhere(
                  (value) => value.value == colors[index],
                  orElse: () => PropertyValue(value: "", id: -1),
                );

                // Now, colorPropertyValue.id contains the ID associated with the color
                int colorId = colorPropertyValue.id;

                // Get the product variation using the property value id
                productVariation = widget.product.variations.firstWhere(
                  (variation) => variation.id == colorId,
                );
              });
            },
            child: Stack(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(2.5),
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Color(int.parse(color, radix: 16)),
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _displayDescriptionExpansionPanel() {
    return Theme(
      data: ThemeData.dark(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ExpansionPanelList(
          expandedHeaderPadding: const EdgeInsets.all(10),
          expansionCallback: (panelIndex, isExpanded) {
            setState(() {
              _isExpandedValue = isExpanded;
            });
          },
          children: [
            ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return const ListTile(
                  title: Text('DESCRIPTION'),
                );
              },
              body: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 30),
                child: Text(
                  widget.product.description,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              isExpanded: _isExpandedValue,
            ),
          ],
        ),
      ),
    );
  }

  _buildMaterialDetails() {
    // adds all sizes in this variant to a list

    // Assuming productVariation is your ProductVariation instance
    List<String> materials = productVariation.productPropertiesValues
        .where((propertyValue) => propertyValue.property == 'Materials')
        .map((propertyValue) => propertyValue.value)
        .toList();

// Now, sizes contains all size values for the 'Size' property

    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Select Material',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Center(
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return ElevatedButton(
                    child: Text(materials[index]),
                    onPressed: () {
                      setState(() {
                        AvailableProperties materialProperty =
                            widget.product.availableProperties.firstWhere(
                          (property) => property.property == "Materials",
                          orElse: () =>
                              AvailableProperties(property: "", values: []),
                        );
                        PropertyValue materialPropertyValue =
                            materialProperty.values.firstWhere(
                          (value) => value.value == materials[index],
                          orElse: () => PropertyValue(
                              value: "", id: -1), // Default values if not found
                        );

                        int materialId = materialPropertyValue.id;

                        productVariation = widget.product.variations.firstWhere(
                          (variation) => variation.id == materialId,
                        );
                      });
                    },
                  );
                }),
                itemCount: materials.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
