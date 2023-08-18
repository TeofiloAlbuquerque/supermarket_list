import 'package:cloud_firestore/cloud_firestore.dart';

class DBFireStore {
  // Tornando o construtor privado
  DBFireStore._();
  // Metodo estatico que irá receber o construtor da classe
  static final DBFireStore _instance = DBFireStore._();
  // Salvar a instancia do Firestore, dessa forma podemos recuperar a instancia
  // do firebase
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Metodo estatico para podermos acessar a instancia do Firestore
  static FirebaseFirestore get() {
    return DBFireStore._instance._firestore;
  }
}
