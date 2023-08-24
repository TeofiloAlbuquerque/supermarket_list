import 'package:cloud_firestore/cloud_firestore.dart';

class DBFireStore {
  // Tornando o construtor privado
  DBFireStore._();
  // Metodo estatico que irá receber o construtor da classe
  static final DBFireStore _instance = DBFireStore._();
  // Salvar a instancia do Firestore, dessa forma podemos recuperar a instancia
  // do firebase
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Metodo estatico para podermos acessar a instancia do Firestore
  static FirebaseFirestore get() {
    return DBFireStore._instance._firestore;
  }
  // Método para adicionar um produto à coleção "products"
  void addProduct() {
    final products = <String, dynamic>{
      "name": "Uva",
      "price": 6.80,
      "unit": "kg",
      "quantity": 1,
      "category": "fruits",
    };
    _firestore.collection("products").add(products).then(
        (DocumentReference doc) =>
            print("DocumentSnapshot added with ID: ${doc.id}"));

    
  }
  // Método para ler todos os produtos da coleção "products"
  Future<void> getProducts() async {
    await _firestore.collection("products").get().then((event) {
      for (var doc in event.docs) {
        print('${doc.id} => ${doc.data()}');
      }
    });
  }
}
