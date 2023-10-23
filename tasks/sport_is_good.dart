import 'dart:math';


Future<void> main() async {
  final group1 = [
    Fencer(name: 'Дима', level: SkillsLevel.profi),
    Fencer(name: 'Ира', level: SkillsLevel.profi),
  ];
  final sportGroup1 = SportGroupClass(group: group1);
  final trainer1 = FencingTrainer(name: 'Василий Константинопольскович', specialization: Specialization.saber);
  Sport sport = Sport(trainer: trainer1, group: sportGroup1);
  sport.organizeFencing();
  final duel = sport.fencing.organiseDuel();
  duel.spendDuel();

}
interface class SportGroupClass<T>{
  SportGroupClass({required this.group});
  final List<T> group;
}
class Sport {

  Sport( {required this.trainer,required this.group});

  final FencingTrainer trainer;
  final SportGroupClass group;

  late final Fencing fencing;

  void organizeFencing()=>fencing=Fencing(trainer: trainer, group: group);


}
class Fencing extends Sport{
  Fencing({required super.trainer, required super.group});

  Duel organiseDuel()=> Duel(firstOpponent: group.group.first, secondOpponent: group.group.last);
}

class FencingTrainer{
  FencingTrainer({
    required this.name,
    required this.specialization,
  });
  final String name;
  final Specialization specialization;

  void outInfo() =>
      print('Имя: $name\nСпециализация: $prepareSpecialization');
  String prepareSpecialization() {
    switch (specialization) {
      case Specialization.bayonet:
        return "Штыки";
      case Specialization.rapier:
        return "Рапира";
      case Specialization.saber:
        return "Сабля";
      case Specialization.swords:
        return "Меч";
    }
  }
}

class Fencer{
  Fencer({
    required this.name,
    required this.level,
  });
  final String name;
  final SkillsLevel level;
  String printInfo() => 'Имя: $name\nУровень подготовки: ${prepareLevel()}';
  String prepareLevel() {
    switch (level) {
      case SkillsLevel.beginner:
        return "Новичок";
      case SkillsLevel.enthusiast:
        return "Любитель";
      case SkillsLevel.profi:
        return "Профи";
    }
  }
}

class Duel{
  Duel({required this.firstOpponent, required this.secondOpponent});
  final Fencer firstOpponent;
  final Fencer secondOpponent;
  void output() => print(
      'Первый оппонент: ${firstOpponent.printInfo()}\nВторой оппонент: ${secondOpponent.printInfo()}');
  void spendDuel(){
    final chance1 = countChance(fencer: firstOpponent);
    final chance2 = countChance(fencer: secondOpponent);
    print("Поединок начался\n");
    output();
    late final bool result;
    if(chance1==chance2){
      result=Random().nextBool();
    }else{
      result=chance1 > chance2;
    }
    print("Поединок закончился. Победил...\n");
    print(result ? firstOpponent.printInfo() : secondOpponent.printInfo());
  }
  static double countChance({required Fencer fencer}) {
    double chance = 0.0;
    switch (fencer.level) {
      case SkillsLevel.profi:
        chance = 1.0;
      case SkillsLevel.beginner:
        chance = 0.3;
      case SkillsLevel.enthusiast:
        chance = 0.5;
    }
    return chance;
  }
}

enum SkillsLevel {
  beginner,
  enthusiast,
  profi,
}

enum Specialization {
  rapier,
  swords,
  bayonet,
  saber,
}
