import 'dart:developer';
import 'dart:math';

void main() {
  var random = Random();
  int length = random.nextInt(4) + 4;
  List<int> numberlist = List.generate(length, (_) => random.nextInt(9) + 1);
  List<int> mylist = [];
  int attempt = 0;

  while (true) {
    attempt++;
    mylist = List.generate(numberlist.length, (_) => random.nextInt(9) + 1);
    if (mylist.toString() != numberlist.toString()) {
      mylist.clear();
    } else {
      break;
    }
  }
  print("Deneme $attempt");
  print("Aranan Liste $numberlist");
  print("Mylist: $mylist");
}
