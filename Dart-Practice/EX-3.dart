void main() {
  // List of student scores
  List<int> scores = [45, 78, 62, 49, 85, 33, 90, 50];

  // You code
  var studentScore = scores.where((scores) => scores >= 50);
  print(studentScore.toList());
  print('${studentScore.length} student passed');
}

