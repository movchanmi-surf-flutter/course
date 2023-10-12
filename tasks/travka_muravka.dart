void main() {
  final machineries = _getMachineries(maps: [mapBefore2010, mapAfter2010]);
  for (final m in machineries) print(m.toJson());

  final result = _averageAge(machines: machineries);
  print("Средний возраст: $result");
}

///Получить список уникальных элементов агротехники
List<AgriculturalMachinery> _getMachineries(
    {required List<Map<Countries, List<Territory>>> maps}) {
  Set<AgriculturalMachinery> machines = {};

  for (final map in maps)
    map.forEach((country, territories) {
      for (final territory in territories)
        machines.addAll(territory.machineries);
    });
  final uniqueList = List<AgriculturalMachinery>.from(machines);
  uniqueList.sort((a, b) => a.releaseDate.compareTo(b.releaseDate));
  return uniqueList;
}
///Расчет среднего возраста самой старой техники
int _averageAge({required List<AgriculturalMachinery> machines}) {
  final halfLength = machines.length ~/ 2;
  if (halfLength != 0) {
    return _countAgeSum(
            ages: machines.toList().getRange(0, halfLength).toList()) ~/
        halfLength;
  } else {
    return 0;
  }
}
///Подсчет суммы старой техники (доля 50% от всей техники)
int _countAgeSum({required List<AgriculturalMachinery> ages}) {
  int sum = 0;
  for (final age in ages) sum += age.releaseDate.year;
  return sum;
}

final mapBefore2010 = <Countries, List<Territory>>{
  Countries.brazil: [
    Territory(
      34,
      ['Кукуруза'],
      [
        AgriculturalMachinery(
          'Трактор Степан',
          DateTime(2001),
        ),
        AgriculturalMachinery(
          'Культиватор Сережа',
          DateTime(2007),
        ),
      ],
    ),
  ],
  Countries.russia: [
    Territory(
      14,
      ['Картофель'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Гранулятор Антон',
          DateTime(2009),
        ),
      ],
    ),
    Territory(
      19,
      ['Лук'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Дробилка Маша',
          DateTime(1990),
        ),
      ],
    ),
  ],
  Countries.turkish: [
    Territory(
      43,
      ['Хмель'],
      [
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
        AgriculturalMachinery(
          'Сепаратор Марк',
          DateTime(2005),
        ),
      ],
    ),
  ],
};

final mapAfter2010 = {
  Countries.turkish: [
    Territory(
      22,
      ['Чай'],
      [
        AgriculturalMachinery(
          'Каток Кирилл',
          DateTime(2018),
        ),
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
      ],
    ),
  ],
  Countries.japan: [
    Territory(
      3,
      ['Рис'],
      [
        AgriculturalMachinery(
          'Гидравлический молот Лена',
          DateTime(2014),
        ),
      ],
    ),
  ],
  Countries.spain: [
    Territory(
      29,
      ['Арбузы'],
      [
        AgriculturalMachinery(
          'Мини-погрузчик Максим',
          DateTime(2011),
        ),
      ],
    ),
    Territory(
      11,
      ['Табак'],
      [
        AgriculturalMachinery(
          'Окучник Саша',
          DateTime(2010),
        ),
      ],
    ),
  ],
};

enum Countries { brazil, russia, turkish, spain, japan }

class Territory {
  final int areaInHectare;
  final List<String> crops;
  final List<AgriculturalMachinery> machineries;

  Territory(
    this.areaInHectare,
    this.crops,
    this.machineries,
  );
}

class AgriculturalMachinery {
  final String id;
  final DateTime releaseDate;

  AgriculturalMachinery(
    this.id,
    this.releaseDate,
  );

  /// Переопределяем оператор "==", чтобы сравнивать объекты по значению.
  @override
  bool operator ==(Object? other) {
    if (other is! AgriculturalMachinery) return false;
    if (other.id == id && other.releaseDate == releaseDate) return true;

    return false;
  }

  @override
  int get hashCode => id.hashCode ^ releaseDate.hashCode;

  Map toJson() => {"id": id, "releaseDate": releaseDate};
}
