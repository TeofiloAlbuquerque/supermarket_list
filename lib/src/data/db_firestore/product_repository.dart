// // Para ler e gravar dados no banco de dados
// //DatabaseReference ref = FirebaseDatabase.instance.ref();
// import 'package:firebase_database/firebase_database.dart';
// import '../../models/product_model.dart';

// class ProductRepository {
//   final database = FirebaseDatabase.instance.ref('products');

//   late List<Product> _products;

//   Future<List<Product>> get products async {
//     _products = await getProductsFromFirebase();

//     return _products;
//   }

//   Future<List<Product>> getProductsFromFirebase() async {
//     final productsReference = database.ref().child('products');
//     final snapshot = await productsReference.get();
//     final products = snapshot.children.map((child) {
//       final product = Product.fromJson(child.value as Map<String, dynamic>);
//       return product;
//     }).toList();

//     return products;
//   }
// }
