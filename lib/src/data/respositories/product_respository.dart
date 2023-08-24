import 'package:lista_compras/src/data/datasources/product_datasource.dart';
import 'package:lista_compras/src/domain/models/product_model.dart';

class ProductRepository {
  final ProductDataSource _dataSource = ProductDataSource();

  Future<void> createProduct(String name) async {
    final product = Product(name: name);
    await _dataSource.createProduct(product);
  }

  Stream<List<Product>> fetchProducts() {
    return _dataSource.fetchProducts();
  }
}
