import 'package:alphabet/core/models/animal.dart';

enum Lesson {
  one(animal: Animal.bear, exampleHeader: 'bear'),
  two(animal: Animal.cat, exampleHeader: 'cats'),
  three(animal: Animal.chicken, exampleHeader: 'chickens'),
  four(animal: Animal.cow, exampleHeader: 'cows'),
  five(animal: Animal.dear, exampleHeader: 'dears'),
  six(animal: Animal.dog, exampleHeader: 'dogs'),
  seven(animal: Animal.donkey, exampleHeader: 'donkeys'),
  eight(animal: Animal.duck, exampleHeader: 'ducks'),
  nine(animal: Animal.fox, exampleHeader: 'foxes'),
  ten(animal: Animal.giraffe, exampleHeader: 'giraffes'),
  eleven(animal: Animal.horse, exampleHeader: 'horses'),
  twelve(animal: Animal.goat, exampleHeader: 'goats'),
  thirteen(animal: Animal.lion, exampleHeader: 'lions'),
  fourteen(animal: Animal.owl, exampleHeader: 'owls'),
  fifteen(animal: Animal.panda, exampleHeader: 'pandas'),
  sixteen(animal: Animal.pig, exampleHeader: 'pigs'),
  seventeen(animal: Animal.rabbit, exampleHeader: 'rabbits'),
  eighteen(animal: Animal.sheep, exampleHeader: 'sheeps'),
  nineteen(animal: Animal.wolf, exampleHeader: 'wolves'),
  twenty(animal: Animal.tiger, exampleHeader: 'tigers'),
  completed(animal: Animal.bear, exampleHeader: 'completed');

  final Animal animal;
  final String exampleHeader;

  const Lesson({required this.animal, required this.exampleHeader});

  int get number => Lesson.values.indexOf(this) + 1;
}
