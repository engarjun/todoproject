import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:todoproject/13_curd_class/update_products.dart';
import 'package:todoproject/13_curd_class/utils/urls.dart';

import 'models/product_model.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.product,
    required this.refreshProductList,
  });

  final ProductModel product;
  final VoidCallback refreshProductList;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool _deleteInProgress = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        width: 30,
        widget.product.image,
        errorBuilder: (_, __, ___) {
          return Icon(Icons.error_outline, size: 30);
        },
      ),
      title: Text(widget.product.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Code: ${widget.product.code}'),
          SingleChildScrollView(
            child: Row(
              spacing: 5,
              children: [
                Text('Quantity: ${widget.product.quantity}'),
                Text('Unit Price: ${widget.product.unitPrice}'),
              ],
            ),
          ),
        ],
      ),
      trailing: Visibility(
        visible: _deleteInProgress == false,
        replacement: CircularProgressIndicator(),
        child: PopupMenuButton<ProductOption>(
          itemBuilder: (context) {
            return [
              PopupMenuItem(value: ProductOption.update, child: Text('Update')),
              PopupMenuItem(value: ProductOption.delete, child: Text('Delete')),
            ];
          },
          onSelected: (ProductOption selectedOption) {
            if (selectedOption == ProductOption.delete) {
              _deleteProduct();
            } else if (selectedOption == ProductOption.update) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateProducts(product: widget.product),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> _deleteProduct() async {
    _deleteInProgress = true;
    setState(() {});

    Uri uri = Uri.parse(Urls.deleteProductUrl(widget.product.id));
    Response response = await get(uri);

    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      widget.refreshProductList();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Product deleted successfully')));
      //widget.refreshProductList();
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Delete failed')));
    }
    _deleteInProgress = false;
    setState(() {});
  }
}

enum ProductOption { update, delete }
