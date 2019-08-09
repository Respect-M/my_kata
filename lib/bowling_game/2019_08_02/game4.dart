class Game {
  final List<int> rolls = new List(21);

  int currentRoll = 0;

  void roll(int pins) {

    rolls[currentRoll] = pins;

    currentRoll ++;
  }

  int score() {
    int score = 0;

    int frameIndex = 0;

    for(int frame = 0; frame < 10; frame ++) {
      if(isStrike(frameIndex)) {
        score += 10 + strikeBonus(frameIndex);
        frameIndex ++;
      } else if(isSpare(frameIndex)) {
        score += 10 + spareBonus(frameIndex);
        frameIndex +=2;
      } else {
        score += sumOfBallsInFrame(frameIndex);
        frameIndex += 2;
      }
    }

    return score;
  }

  bool isStrike(int frameIndex) {
    return rolls[frameIndex] == 10;
  }

  bool isSpare(int frameIndex) {
    return rolls[frameIndex] + rolls[frameIndex + 1] == 10;
  }

  int strikeBonus(int frameIndex) {
    return rolls[frameIndex + 1] + rolls[frameIndex + 2];
  }

  int spareBonus(int frameIndex) {
    return rolls[frameIndex + 2];
  }

  int sumOfBallsInFrame(int frameIndex) {
    return rolls[frameIndex] + rolls[frameIndex + 1];
  }

}
