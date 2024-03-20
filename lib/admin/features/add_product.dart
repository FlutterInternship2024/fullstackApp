import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fruitsapp/admin/features/services/selectImage.dart';
import 'package:fruitsapp/admin/features/services/uploadImagetoStorage.dart';
import 'package:fruitsapp/widgets/displaySnackbar.dart';
import 'package:image_picker/image_picker.dart';

import 'adminHomeScreen.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});
  static const routeName = '/add-product-screen';
  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  Uint8List? image;
  String category = 'Fresh Fruits';
  String res = 'error';
  bool isLoading = false;
  List<String> productCategories = [
    'Fresh Fruits',
    'Organic Fruits',
    'Seasonal Fruits',
    'Dried Fruits',
    'Gift Baskets',
    'Bulk Purchases',
  ];
  void _selectImages() async {
    var imageDocs = await getImage(source: ImageSource.gallery);
    setState(() {
      image = imageDocs;
    });
  }

  void uploadImages() async {
    setState(() {
      isLoading = true;
    });
    res = await AdminServices().uploadProduct(
        context: context,
        productName: _productnamecontroller.text.trim(),
        itemCount: _productquantitycontroller.text.trim(),
        price: _productpricecontroller.text.trim(),
        desc: _productdescriptioncontroller.text.trim(),
        unit: 'kg',
        category: category,
        file: image!);
    if (res == 'Success') {
      setState(() {
        isLoading = false;
      });
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return AdminHomePage();
      }), (route) => false);
    } else {
      setState(() {
        isLoading = false;
      });
      displaySnackBar(context: context, content: res);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _productnamecontroller.dispose();
    _productdescriptioncontroller.dispose();
    _productpricecontroller.dispose();
    _productquantitycontroller.dispose();
  }

  final _addProductkey = GlobalKey<FormState>();
  final TextEditingController _productnamecontroller = TextEditingController();
  final TextEditingController _productdescriptioncontroller =
      TextEditingController();
  final TextEditingController _productpricecontroller = TextEditingController();
  final TextEditingController _productquantitycontroller =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (image == null)
                    ? GestureDetector(
                        onTap: _selectImages,
                        child: Center(
                          child: DottedBorder(
                              dashPattern: [6, 3, 6, 3],
                              borderPadding: EdgeInsets.all(10),
                              borderType: BorderType.RRect,
                              radius: Radius.circular(15),
                              child: Container(
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height / 4,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.folder),
                                      Text(
                                        'Select Product Image',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      )
                    : Image.memory(
                        image!,
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                Form(
                    key: _addProductkey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _productnamecontroller,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'Product name',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _productdescriptioncontroller,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'Product description',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _productpricecontroller,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'Product price',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _productquantitycontroller,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'Product quantity',
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                    width: double.infinity,
                    child: DropdownButton(
                      icon: Icon(Icons.arrow_drop_down),
                      value: category,
                      items: productCategories.map((item) {
                        return DropdownMenuItem(
                          child: Text(item),
                          value: item,
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          category = value!;
                        });
                      },
                    )),
                (isLoading)
                    ? Container(
                        width: double.infinity,
                        height: 40,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.zero,
                        ),
                        child: Center(
                          child: const CircularProgressIndicator(
                            color: Colors.green,
                          ),
                        ),
                      )
                    : ElevatedButton(
                        child: Text('Sell'),
                        onPressed: () {
                          if (_addProductkey.currentState!.validate()) {
                            if (image == null) {
                              displaySnackBar(
                                  context: context,
                                  content: 'Add image of the product!!');
                            } else {
                              uploadImages();
                              print('Add Successful!');
                            }
                          }
                        }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
