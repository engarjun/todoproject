import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProducts extends StatefulWidget {
  const AddNewProducts({super.key});

  @override
  State<AddNewProducts> createState() => _AddNewProductsState();
}

class _AddNewProductsState extends State<AddNewProducts> {
  bool _addProductInProgress = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _codeEditingController = TextEditingController();
  final TextEditingController _quantityEditingController = TextEditingController();
  final TextEditingController _priceEditingController = TextEditingController();
  final TextEditingController _imageEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add new products')),
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
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Input the value!';
                  }
                  return null;
                },
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _codeEditingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Product Code',
                  labelText: 'Product Code',
                ),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Input the value!';
                  }
                  return null;
                },
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _quantityEditingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Quantity',
                  labelText: 'Quantity',
                ),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Input the value!';
                  }
                  return null;
                },
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _priceEditingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Product Price',
                  labelText: 'Product Price',
                ),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Input the value!';
                  }
                  return null;
                },
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _imageEditingController,
                decoration: InputDecoration(
                  hintText: 'Images Url',
                  labelText: 'Images Url',
                ),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Input the value!';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 10),
              Visibility(
                visible: _addProductInProgress == false,
                replacement: Center(child: CircularProgressIndicator()),
                child: FilledButton(
                  onPressed: _onTapAddProductButton,
                  child: Text('Add Product'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onTapAddProductButton() async {
    if (_formKey.currentState!.validate() == false) {
      return;
    }
    _addProductInProgress = true;
    setState(() {});
    // Need URI
    Uri uri = Uri.parse('http://35.73.30.144:2008/api/v1/CreateProduct');
    // Prepare data
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
      body: jsonEncode(requestBody),
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      if (decodedJson['status'] == 'success') {
        _clearTextField();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Product inserted successfully')),
        );
      } else {
        String errorMessage = decodedJson['data'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Product successfully Not inserted!: $errorMessage'),
          ),
        );
      }
    }

    _addProductInProgress = true;
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
