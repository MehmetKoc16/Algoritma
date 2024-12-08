import 'dart:math';

void main() {
  var random = Random();
  int counter = 0;
  List<int> number_list = [];
  int data = 0;

  List<int> target_list = [1, 3, 5, 7, 9];

  while (true) {
    int counter2 = 0;
    number_list.clear();
    for (var i = 0;; i++) {
      data = random.nextInt(10);
      if (data % 2 == 1) {
        number_list.add(data);
        counter2++;
        if (counter2 == 5) {
          break;
        }
      }
    }
    counter++;

    if (number_list.toString() == target_list.toString()) {
      break;
    }
  }
  print("istebilen liste $number_list");
  print("Deneme sonucu: $counter");
}
