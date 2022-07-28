import "dart:io";
import "dart:math";

Random random = Random();

void main() {
  SpaceShip sp1 = ArmoredSpaceShip(0.40, 100);
  SpaceShip sp2 = HighSpeedSpaceShip(true, 50);
  BattleField().startBattle(sp1, sp2);
}

abstract class SpaceShip {
  double health;
  double firePower;
  double enemyFirePower;

  void hit();

  void isDestroyed();

  SpaceShip(this.health, this.firePower, this.enemyFirePower);
}

class ArmoredSpaceShip implements SpaceShip {
  @override
  double health = 500;
  @override
  double firePower = 100;
  @override
  double enemyFirePower;
  double maxArmorPower;
  ArmoredSpaceShip(this.maxArmorPower, this.enemyFirePower);

  @override
  void hit() {
    double randomArmorPower = Random().nextDouble() * maxArmorPower;
    double damage = enemyFirePower * (1 - randomArmorPower);
    health = health - damage;
    print("Spaceship 1 is being attacked!");
  }

  @override
  void isDestroyed() {
    print("Game Over. Spaceship 1 crashed...");
  }
}

class HighSpeedSpaceShip implements SpaceShip {
  @override
  double health = 250;
  @override
  double firePower = 100;
  @override
  double enemyFirePower;
  bool dodging;
  HighSpeedSpaceShip(this.dodging, this.enemyFirePower);

  @override
  void hit() {
    dodging = random.nextBool();
    double damage = enemyFirePower;
    if (dodging == false) {
      health = health - damage;
      print("Spaceship 2 is being attacked!");
    } else if (dodging == true) {
      health = health + 0;
      print("Spaceship 2 dodged the attack!");
    }
  }

  @override
  void isDestroyed() {
    print("GAME OVER. Spaceship 2 is crashed...");
  }
}

class BattleField {
  void startBattle(SpaceShip sp1, SpaceShip sp2) {
    while (sp1.health > 0 && sp2.health > 0) {
      sp1.hit();
      print("Spaceship 1 health: ${sp1.health}\n");
      sleep(Duration(seconds: 1));
      sp2.hit();
      print("Spaceship 2 health: ${sp2.health}\n");
      sleep(Duration(seconds: 1));
    }
    print("Spaceship 1 health: ${sp1.health} HP");
    print("Spaceship 2 health: ${sp2.health} HP");
    if (sp1.health <= 0) {
      ArmoredSpaceShip(0.40, 100).isDestroyed();
    } else if (sp2.health <= 0) {
      HighSpeedSpaceShip(true, 50).isDestroyed();
    }
  }
}