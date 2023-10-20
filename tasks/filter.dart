final articles = '''
1,хлеб,Бородинский,500,5
2,хлеб,Белый,200,15
3,молоко,Полосатый кот,50,53
4,молоко,Коровка,50,53
5,вода,Апельсин,25,100
6,вода,Бородинский,500,5
''';
void main() {
  final List<String> splittedList = articles.split('\n');
  List<Merchant> merchantList=[];
  for(final String value in splittedList)
    merchantList.add(Merchant.fromStringToEx(stringValue: value));

}

abstract class Filter {
  bool apply() => true;
}

class Merchant {
  Merchant(
      {required this.id,
      required this.name,
      required this.type,
      required this.price,
      required this.quantity});
  final int id;
  final String name;
  final String type;
  final double price;
  final int quantity;

  static Merchant fromStringToEx({required String stringValue}) {
    final List<String> splittedData = stringValue.split(',');

    return Merchant(
        id: int.parse(splittedData.first),
        name: splittedData[1],
        type: splittedData[2],
        price: double.parse(splittedData[3]),
        quantity: int.parse(splittedData[4]),
    );
  }
}
