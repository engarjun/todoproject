import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:todoproject/13_curd_class/models/product_model.dart';
import 'package:todoproject/13_curd_class/product_item.dart';
import 'package:todoproject/13_curd_class/utils/urls.dart';
import 'add_new_products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ProductModel> _productList = [];

  bool _getProductProgress = false;

  @override
  void initState() {
    super.initState();
    _getProductList();
  }

  Future<void> _getProductList() async {
    _productList.clear();
    _getProductProgress = true;
    setState(() {});

    Uri uri = Uri.parse(Urls.getProductsUrl);
    Response response = await get(uri);

    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      for (Map<String, dynamic> productJson in decodedJson['data']) {
        ProductModel productModel = ProductModel.formJson(productJson);

        _productList.add(productModel);
      }
    }
    _getProductProgress = false;

    setState(() {});
  }
//https://img.freepik.com/free-psd/close-up-delicious-apple_23-2151868338.jpg
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'This is curd project example',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _getProductList();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Visibility(
        visible: _getProductProgress == false,
        replacement: Center(child: CircularProgressIndicator()),
        child: ListView.separated(
          itemCount: _productList.length,
          itemBuilder: (context, index) {
            // ProductModel product = _productList[index];
            return ProductItem(
              product: _productList[index],
              refreshProductList: () {
                _getProductList();
              },
            );
          },

          separatorBuilder: (context, index) {
            return Divider(indent: 70);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewProducts()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
