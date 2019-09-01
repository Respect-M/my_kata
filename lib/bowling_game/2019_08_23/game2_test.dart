import 'package:flutter_test/flutter_test.dart';
import 'package:kaka/bowling_game/2019_08_23/game1.dart';

void main() {
  group('Game Test', () {
    Game g = new Game();

    void rollMany(int n, int pins) {
      for (var i = 0; i < n; i++) {
        g.roll(pins);
      }
    }

    void rollSpare() {
      g.roll(5);
      g.roll(5);
    }

    void rollStrike() {
      g.roll(10);
    }

    test('testGutterGame', () {
      rollMany(20, 0);

      assert(g.score() == 0);
    });

    test('testAllOnes', () {
      rollMany(20, 1);

      expect(g.score(), 20);
    });

    test('testOneSpare', () {
      rollSpare();
      g.roll(3);
      rollMany(17,0);

      assert(g.score() == 16);
    });

    test('testOneStrike', () {
      rollStrike();
      g.roll(3);
      g.roll(4);
      rollMany(16, 0);

      assert(g.score() == 24);
    });

    test('testPerfectGame', () {
      rollMany(12,10);

      expect(g.score(), 300);
    });
  });
  
}