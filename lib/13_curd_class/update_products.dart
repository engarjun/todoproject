import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:todoproject/13_curd_class/models/product_model.dart';
import 'package:todoproject/13_curd_class/utils/urls.dart';

class UpdateProducts extends StatefulWidget {
  const UpdateProducts({super.key, required this.product});

  final ProductModel product;

  @override
  State<UpdateProducts> createState() => _UpdateProductsState();
}

class _UpdateProductsState extends State<UpdateProducts> {
  bool _updateroductInProgress = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _codeEditingController = TextEditingController();
  final TextEditingController _quantityEditingController =
      TextEditingController();
  final TextEditingController _priceEditingController = TextEditingController();
  final TextEditingController _imageEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _nameEditingController.text = widget.product.name;
    _codeEditingController.text = widget.product.code.toString();
    _quantityEditingController.text = widget.product.quantity.toString();
    _priceEditingController.text = widget.product.unitPrice.toString();
    _imageEditingController.text = widget.product.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Products')),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 8,
            children: [
              TextFormField(
                textInputAction: TextInputAction.next,

                controller: _nameEditingController,
                decoration: InputDecoration(
                  hintText: 'Product Name',
                  labelText: 'Product Name',
                ),
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _codeEditingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Product Code',
                  labelText: 'Product Code',
                ),
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _quantityEditingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Quantity',
                  labelText: 'Quantity',
                ),
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _priceEditingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Product Price',
                  labelText: 'Product Price',
                ),
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _imageEditingController,
                decoration: InputDecoration(
                  hintText: 'Images Url',
                  labelText: 'Images Url',
                ),
              ),

              const SizedBox(height: 10),
              FilledButton(onPressed: _updateProductButton, child: Text('Update')),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _updateProductButton() async {

    if (_formKey.currentState!.validate() == false) {
      return;
    }
    _updateroductInProgress = true;
    setState(() {});
    // Need URI
    Uri uri = Uri.parse(Urls.updateProductUrl(widget.product.id));
    //Uri uri = Uri.parse('http://35.73.30.144:2008/api/v1/CreateProduct');
    int totalPrice = int.parse(_quantityEditingController.text.trim()) * int.parse(_priceEditingController.text.trim());
    Map<String, dynamic> requestBody = {
      "ProductName": _nameEditingController.text.trim(),
      "ProductCode": int.parse(_codeEditingController.text.trim()),
      "Img": _imageEditingController.text.trim(),
      "Qty": int.parse(_quantityEditingController.text.trim()),
      "UnitPrice": int.parse(_priceEditingController.text.trim()),
      "TotalPrice": totalPrice,
    };
    // Request with data
    Response response = await post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody)
     // body: jsonEncode(requestBody),
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      if (decodedJson['status'] == 'success') {
        _clearTextField();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Product Updated successfully')),
        );
      } else {
        String errorMessage = decodedJson['data'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Product successfully Not Updated!: $errorMessage'),
          ),
        );
      }
    }

    _updateroductInProgress = true;
    setState(() {});
  }

  void _clearTextField() {
    _nameEditingController.clear();
    _codeEditingController.clear();
    _quantityEditingController.clear();
    _priceEditingController.clear();
    _imageEditingController.clear();
  }

  @override
  void dispose() {
    _nameEditingController.dispose();
    _codeEditingController.dispose();
    _quantityEditingController.dispose();
    _priceEditingController.dispose();
    _imageEditingController.dispose();
    super.dispose();
  }
}
