import 'package:crud_lista_compras/src/models/item.dart';

// Dados mockados
const dummyItems = {
  '1': Item(
    id: '1',
    name: 'Pão de leite',
    amout: 1,
    unit: 'g',
    price: 4.50,
    category: 'Padaria',
    observation: 'Tem que ter sido feito no dia',
    imageUrl:
        'https://img.freepik.com/fotos-gratis/pao-delicioso-na-mesa_144627-12456.jpg?w=900&t=st=1688858912~exp=1688859512~hmac=6c8a55109e90d9cea130af8fac0a94b3edbb6e89312e6c30725ff34da55037b8',
  ),
  '2': Item(
    id: '1',
    name: 'Oleo de Girassol',
    amout: 1,
    unit: 'ml',
    price: 3.80,
    category: 'Cozinha',
    observation: '500ml',
    imageUrl: 'https://cdn-icons-png.flaticon.com/512/3063/3063331.png',
  ),
  '3': Item(
    id: '1',
    name: 'Frango',
    unit: 'kg',
    amout: 1,
    price: 18.80,
    category: 'Frios',
    observation: 'Marca Sadia',
    imageUrl:
        'https://cdn.pixabay.com/photo/2016/03/31/20/27/avatar-1295773_1280.png',
  ),
  '4': Item(
    id: '1',
    name: 'Sal',
    unit: 'g',
    amout: 1,
    price: 2.75,
    category: 'Cozinha',
    observation: 'Refinado',
    imageUrl:
        'https://cdn.pixabay.com/photo/2016/03/31/21/40/angry-1296580_1280.png',
  ),
};
