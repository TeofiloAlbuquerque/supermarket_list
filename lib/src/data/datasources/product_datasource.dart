import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lista_compras/src/domain/models/product_model.dart';

class ProductDataSource {
  final CollectionReference _productCollection =
      FirebaseFirestore.instance.collection('products');

  Future<void> createProduct(Product product) async {
    final newDocProduct = _productCollection.doc();
    await newDocProduct.set(product.toJson());
  }

  Stream<List<Product>> fetchProducts() {
    return _productCollection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
  }
}
