int similarityScore(String a, String b) {
  int minLength = a.length < b.length ? a.length : b.length;
  int score = 0;
  for (int i = 0; i < minLength; i++) {
    if (a[i] == b[i]) {
      score++;
    } else {
      break;
    }
  }
  return score;
}
