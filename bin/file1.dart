import 'dart:io';
import 'dart:math';

abstract class SpaceShip {
  int health = 1000;
  final random = new Random();
  double random_fire = 1 + random.nextDouble(1000);

  //Methods
  //hit
  //isDestroyed
}

class ArmoredSpaceShip extends SpaceShip{
  //Randomly absorbs hit

  final random = new Random();
  double maxArmorPower = 1 + random.nextDouble(40);

}

class HighSpeedSpaceShip extends SpaceShip {
  //Whether dodges hit or not
  final random = new Random();
  bool dodging = random.nextBool();
  if (dodging){
    print("damage dodged!");
  }

}

class BattleField  {
  void startBattle (SpaceShip sp1, SpaceShip sp2){
    while(Spaceship sp1 >=0 && Spaceship sp2 >=0) {

    }
    //Randomly a space ship selected to hit first
    //SpaceShips hit each other
    //Until one of them is destroyed
  }
}