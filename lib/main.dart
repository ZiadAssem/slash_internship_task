import 'package:flutter/material.dart';
import 'package:slash_internship_task/view/product_details.dart';
import 'classes/product_class.dart';
import 'data_model/data_model.dart';
import 'view/products.dart';
final json = 
{
        "id": 18,
        "name": "Hoodi",
        "description": "comfy training hoodi",
        "brand_id": 4,
        "bosta_size_id": 2,
        "product_rating": 0,
        "estimated_days_preparing": 1,
        "SizeChart": null,
        "subCategory": {
            "id": 2,
            "name": "Mobile Covers"
        },
        "variations": [
            {
                "id": 56,
                "price": 750,
                "quantity": 10,
                "inStock": true,
                "ProductVarientImages": [
                    {
                        "id": 98,
                        "image_path": "https://firebasestorage.googleapis.com/v0/b/slash-f711b.appspot.com/o/images%2Fproduct-variants%2F1702838382360image_picker_D9E944D0-64E3-4ADB-BC4B-73DAE72156F8-7089-000008A4933E0287.jpg?alt=media&token=979eff11-3285-4ca3-9561-7d982f8d9a3e",
                        "product_varient_id": null,
                        "createdAt": "2023-12-17T18:39:44.589Z",
                        "updatedAt": "2023-12-17T18:39:44.589Z"
                    },
                    {
                        "id": 99,
                        "image_path": "https://firebasestorage.googleapis.com/v0/b/slash-f711b.appspot.com/o/images%2Fproduct-variants%2F1702838382361image_picker_E20B455F-794C-4C03-9999-F25979850809-7089-000008A49D1F7633.jpg?alt=media&token=ac689c20-54c3-4dd6-a2f6-360c33372a40",
                        "product_varient_id": null,
                        "createdAt": "2023-12-17T18:39:44.589Z",
                        "updatedAt": "2023-12-17T18:39:44.589Z"
                    }
                ],
                "productPropertiesValues": [
                    {
                        "value": "M",
                        "property": "Size"
                    },
                    {
                        "value": "E0E0E8",
                        "property": "Color"
                    },
                    {
                        "value": "cotton",
                        "property": "Materials"
                    }
                ],
                "productStatus": "APPROVED",
                "isDefault": true,
                "product_variation_status_id": 2
            },
            {
                "id": 62,
                "price": 800,
                "quantity": 7,
                "inStock": true,
                "ProductVarientImages": [
                    {
                        "id": 112,
                        "image_path": "https://firebasestorage.googleapis.com/v0/b/slash-f711b.appspot.com/o/images%2Fproduct-variants%2F1702840752053image_picker_27137E6E-4A21-4F7F-80FE-21C987D57616-7089-000008AAC3821165.jpg?alt=media&token=ee387417-0072-4848-9df1-d6e6a3bdbdc1",
                        "product_varient_id": null,
                        "createdAt": "2023-12-17T19:19:13.549Z",
                        "updatedAt": "2023-12-17T19:19:13.549Z"
                    },
                    {
                        "id": 113,
                        "image_path": "https://firebasestorage.googleapis.com/v0/b/slash-f711b.appspot.com/o/images%2Fproduct-variants%2F1702840752055image_picker_2D3B51CF-7747-4872-8BC0-9065B3BD2269-7089-000008AAC65B92A0.jpg?alt=media&token=e2dc2c72-a242-49c0-b563-d15882285334",
                        "product_varient_id": null,
                        "createdAt": "2023-12-17T19:19:13.549Z",
                        "updatedAt": "2023-12-17T19:19:13.549Z"
                    },
                    {
                        "id": 114,
                        "image_path": "https://firebasestorage.googleapis.com/v0/b/slash-f711b.appspot.com/o/images%2Fproduct-variants%2F1702840752057image_picker_4C726B7B-88EB-4DA1-A51F-DD5CC08AB2ED-7089-000008AAC9EBE672.jpg?alt=media&token=81522dea-7953-4aca-8986-bca895fba0e2",
                        "product_varient_id": null,
                        "createdAt": "2023-12-17T19:19:13.549Z",
                        "updatedAt": "2023-12-17T19:19:13.549Z"
                    }
                ],
                "productPropertiesValues": [
                    {
                        "value": "S",
                        "property": "Size"
                    },
                    {
                        "value": "000000",
                        "property": "Color"
                    },
                    {
                        "value": "cotton",
                        "property": "Materials"
                    }
                ],
                "productStatus": "APPROVED",
                "isDefault": false,
                "product_variation_status_id": 2
            },
            {
                "id": 58,
                "price": 750,
                "quantity": 5,
                "inStock": true,
                "ProductVarientImages": [
                    {
                        "id": 102,
                        "image_path": "https://firebasestorage.googleapis.com/v0/b/slash-f711b.appspot.com/o/images%2Fproduct-variants%2F1702840537447image_picker_CD2B9F76-CF8A-40F1-92A1-7557F8B10F2F-7089-000008A97E4BA025.jpg?alt=media&token=e60a9f82-e37d-4fd6-b39d-7fa09d07a97d",
                        "product_varient_id": null,
                        "createdAt": "2023-12-17T19:15:38.864Z",
                        "updatedAt": "2023-12-17T19:15:38.864Z"
                    },
                    {
                        "id": 103,
                        "image_path": "https://firebasestorage.googleapis.com/v0/b/slash-f711b.appspot.com/o/images%2Fproduct-variants%2F1702840537465image_picker_1877BDBB-888F-4735-A004-ED2D56EEAEE6-7089-000008A9816F9A59.jpg?alt=media&token=4ea368ff-d674-4913-8f7a-5db10ba3bd4f",
                        "product_varient_id": null,
                        "createdAt": "2023-12-17T19:15:38.864Z",
                        "updatedAt": "2023-12-17T19:15:38.864Z"
                    }
                ],
                "productPropertiesValues": [
                    {
                        "value": "L",
                        "property": "Size"
                    },
                    {
                        "value": "E0E0E8",
                        "property": "Color"
                    },
                    {
                        "value": "cotton",
                        "property": "Materials"
                    }
                ],
                "productStatus": "APPROVED",
                "isDefault": false,
                "product_variation_status_id": 2
            },
            {
                "id": 59,
                "price": 750,
                "quantity": 1,
                "inStock": true,
                "ProductVarientImages": [
                    {
                        "id": 104,
                        "image_path": "https://firebasestorage.googleapis.com/v0/b/slash-f711b.appspot.com/o/images%2Fproduct-variants%2F1702840581053image_picker_1AE916AD-0012-4E83-836C-E9FA0EDEB85B-7089-000008A9E2F6374C.jpg?alt=media&token=3c7898f3-3e16-4ddf-bc2d-713fbe29fbd2",
                        "product_varient_id": null,
                        "createdAt": "2023-12-17T19:16:23.152Z",
                        "updatedAt": "2023-12-17T19:16:23.152Z"
                    },
                    {
                        "id": 105,
                        "image_path": "https://firebasestorage.googleapis.com/v0/b/slash-f711b.appspot.com/o/images%2Fproduct-variants%2F1702840581054image_picker_0454402D-F717-4BD9-AC44-C431A8287BDA-7089-000008A9E522EBB0.jpg?alt=media&token=d1069421-9582-4625-a4e0-30b2445e543a",
                        "product_varient_id": null,
                        "createdAt": "2023-12-17T19:16:23.152Z",
                        "updatedAt": "2023-12-17T19:16:23.152Z"
                    }
                ],
                "productPropertiesValues": [
                    {
                        "value": "XL",
                        "property": "Size"
                    },
                    {
                        "value": "E0E0E8",
                        "property": "Color"
                    },
                    {
                        "value": "cotton",
                        "property": "Materials"
                    }
                ],
                "productStatus": "APPROVED",
                "isDefault": false,
                "product_variation_status_id": 2
            },
            {
                "id": 60,
                "price": 700,
                "quantity": 2,
                "inStock": true,
                "ProductVarientImages": [
                    {
                        "id": 106,
                        "image_path": "https://firebasestorage.googleapis.com/v0/b/slash-f711b.appspot.com/o/images%2Fproduct-variants%2F1702840666672image_picker_81E07382-1F38-4CE7-A640-08E9AB45D72F-7089-000008AA28AEEF33.jpg?alt=media&token=726f5782-3858-4a78-894a-c4bf511244c1",
                        "product_varient_id": null,
                        "createdAt": "2023-12-17T19:17:48.668Z",
                        "updatedAt": "2023-12-17T19:17:48.668Z"
                    },
                    {
                        "id": 107,
                        "image_path": "https://firebasestorage.googleapis.com/v0/b/slash-f711b.appspot.com/o/images%2Fproduct-variants%2F1702840666675image_picker_5F62AAC3-3473-462E-A488-551DA664FE9C-7089-000008AA2E9D94EF.jpg?alt=media&token=333bcf43-0628-43ea-8c6f-079c95bf4b9f",
                        "product_varient_id": null,
                        "createdAt": "2023-12-17T19:17:48.668Z",
                        "updatedAt": "2023-12-17T19:17:48.668Z"
                    },
                    {
                        "id": 108,
                        "image_path": "https://firebasestorage.googleapis.com/v0/b/slash-f711b.appspot.com/o/images%2Fproduct-variants%2F1702840666676image_picker_38172C88-929C-45E3-B4FA-907C95C6B679-7089-000008AA345E41F8.jpg?alt=media&token=2cec2e19-ba3f-4a3b-ac28-f63ecd74f666",
                        "product_varient_id": null,
                        "createdAt": "2023-12-17T19:17:48.668Z",
                        "updatedAt": "2023-12-17T19:17:48.668Z"
                    }
                ],
                "productPropertiesValues": [
                    {
                        "value": "m",
                        "property": "Size"
                    },
                    {
                        "value": "568EE1",
                        "property": "Color"
                    },
                    {
                        "value": "cotton",
                        "property": "Materials"
                    }
                ],
                "productStatus": "APPROVED",
                "isDefault": false,
                "product_variation_status_id": 2
            },
            {
                "id": 61,
                "price": 700,
                "quantity": 3,
                "inStock": true,
                "ProductVarientImages": [
                    {
                        "id": 109,
                        "image_path": "https://firebasestorage.googleapis.com/v0/b/slash-f711b.appspot.com/o/images%2Fproduct-variants%2F1702840705658image_picker_B4984AFC-CCA6-4077-85C4-96918CF22F59-7089-000008AA926B16AF.jpg?alt=media&token=80fce31b-a670-4ebc-abe6-e14b7745644f",
                        "product_varient_id": null,
                        "createdAt": "2023-12-17T19:18:27.699Z",
                        "updatedAt": "2023-12-17T19:18:27.699Z"
                    },
                    {
                        "id": 110,
                        "image_path": "https://firebasestorage.googleapis.com/v0/b/slash-f711b.appspot.com/o/images%2Fproduct-variants%2F1702840705658image_picker_F1B6EAEB-38FB-4F02-B183-42002AB96DCE-7089-000008AA95E46F77.jpg?alt=media&token=261ac3b8-4226-45d9-9676-e186615a7cb8",
                        "product_varient_id": null,
                        "createdAt": "2023-12-17T19:18:27.699Z",
                        "updatedAt": "2023-12-17T19:18:27.699Z"
                    },
                    {
                        "id": 111,
                        "image_path": "https://firebasestorage.googleapis.com/v0/b/slash-f711b.appspot.com/o/images%2Fproduct-variants%2F1702840705659image_picker_36235B06-AF41-46FB-9179-89DC3645AD9E-7089-000008AA9A5B9953.jpg?alt=media&token=7e60ce55-2aef-4cd3-b99e-188ba368abff",
                        "product_varient_id": null,
                        "createdAt": "2023-12-17T19:18:27.699Z",
                        "updatedAt": "2023-12-17T19:18:27.699Z"
                    }
                ],
                "productPropertiesValues": [
                    {
                        "value": "L",
                        "property": "Size"
                    },
                    {
                        "value": "568EE1",
                        "property": "Color"
                    },
                    {
                        "value": "cotton",
                        "property": "Materials"
                    }
                ],
                "productStatus": "APPROVED",
                "isDefault": false,
                "product_variation_status_id": 2
            }
        ],
        "avaiableProperties": [
            {
                "property": "Size",
                "values": [
                    {
                        "value": "M",
                        "id": 56
                    },
                    {
                        "value": "S",
                        "id": 62
                    },
                    {
                        "value": "L",
                        "id": 58
                    },
                    {
                        "value": "XL",
                        "id": 59
                    },
                    {
                        "value": "m",
                        "id": 60
                    },
                    {
                        "value": "L",
                        "id": 61
                    }
                ]
            },
            {
                "property": "Color",
                "values": [
                    {
                        "value": "E0E0E8",
                        "id": 56
                    },
                    {
                        "value": "000000",
                        "id": 62
                    },
                    {
                        "value": "E0E0E8",
                        "id": 58
                    },
                    {
                        "value": "E0E0E8",
                        "id": 59
                    },
                    {
                        "value": "568EE1",
                        "id": 60
                    },
                    {
                        "value": "568EE1",
                        "id": 61
                    }
                ]
            },
            {
                "property": "Materials",
                "values": [
                    {
                        "value": "cotton",
                        "id": 56
                    },
                    {
                        "value": "cotton",
                        "id": 62
                    },
                    {
                        "value": "cotton",
                        "id": 58
                    },
                    {
                        "value": "cotton",
                        "id": 59
                    },
                    {
                        "value": "cotton",
                        "id": 60
                    },
                    {
                        "value": "cotton",
                        "id": 61
                    }
                ]
            }
        ],
        "brandName": "Interns",
        "brandImage": "https://firebasestorage.googleapis.com/v0/b/slash-f711b.appspot.com/o/images%2Fbrands%2F1702834720203image_picker_D2A78E9A-EC1F-438C-83C6-AD5011B25C73-7089-00000892F07CC209.png?alt=media&token=5e5c9cc5-e896-4dc9-bed8-56126195f112"
    }    ;
void main() async{
//   DataModel model = DataModel();
//  final products=await model.fetchAllProducts();
//   print(products);


   runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:
      // ProductDetails(product: Product.fromJson(json)),
    
             ViewProducts(),
    );
  }
}
