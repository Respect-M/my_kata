class Game10 {
  final List<int> rolls = new List(21);

  int currentRoll = 0;

  void roll(int pins) {
    rolls[currentRoll++] = pins;
  }

  int score() {
    int scores = 0;
    int frameIndex = 0;
    for (var frame = 0; frame < 10; frame++) {
      if (isStrike(frameIndex)) {
        scores += 10 + strikeBonus(frameIndex);
        frameIndex++;
      } else if (isSpare(frameIndex)) {
        scores += 10 + spareBonus(frameIndex);
        frameIndex += 2;
      } else {
        scores += sumOfBallsInFrame(frameIndex);
        frameIndex += 2;
      }
    }
    return scores;
  }

  bool isSpare(int frameIndex) {
    return rolls[frameIndex] + rolls[frameIndex + 1] == 10;
  }

  int sumOfBallsInFrame(int frameIndex) {
    return rolls[frameIndex] + rolls[frameIndex + 1];
  }

  int spareBonus(int frameIndex) {
    return rolls[frameIndex + 2];
  }

  int strikeBonus(int frameIndex) {
    return rolls[frameIndex + 1] + rolls[frameIndex +2];
  }

  bool isStrike(int frameIndex) {
    return rolls[frameIndex] == 10;
  }
}
