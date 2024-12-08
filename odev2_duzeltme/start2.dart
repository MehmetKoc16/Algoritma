import 'dart:math';

void main() {
  var random = Random();
  int data = 0;
  List<int> numberlist = [0, 0, 0, 0, 0];
  int attempt = 0;
  int temp = 1;
  int i = 0;

  while (i < 5) {
    data = random.nextInt(9) + 1;
    if (data == temp) {
      temp += 2;
      numberlist[i] = data;
      i++;
    }
    attempt++;
  }
  print("Listedeki elemanlar: $numberlist");
  print("Deneme $attempt");
}
