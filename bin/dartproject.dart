void main () async{
  final Animal duck = Duck();
  final Animal cat = Cat ();

  final Animal animal = Animal();

  duck.makeSound();
  cat.makeSound ();
  animal.makeSound();
}



class Animal {
  void makeSound(){
    print('Animal make sound');

  }
}

class Duck extends Animal {
  @override
  void makeSound() => print('Quek Quek');
}

class Cat extends Animal {
  @override
  void makeSound() => print('Mew Mew');
}
