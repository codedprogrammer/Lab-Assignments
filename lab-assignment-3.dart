import 'dart:io';

void main() {
  double subjectCGPA = 0;
  double finalSubjectCGPA = 0;
  var cgpa = [];
  var subjectCGPAValue = [];
  const double cgpaPercentageConstant = 9.5;


  print('Enter value for first subject');
  var score1 = (double.parse(stdin.readLineSync()));
  subjectCGPAValue.add(score1);
  cgpa.add(score1 / 10);


  print('Enter value for second subject');
  var score2 = (double.parse(stdin.readLineSync()));
  subjectCGPAValue.add(score2);
  cgpa.add(score2 / 10);


  print('Enter value for third subject');
  var score3 = (double.parse(stdin.readLineSync()));
  subjectCGPAValue.add(score3);
  cgpa.add(score3 / 10);


  print('Enter value for fourth subject');
  var score4 = (double.parse(stdin.readLineSync()));
  subjectCGPAValue.add(score4);
  cgpa.add(score4 / 10);


  print('Enter value for fifth subject');
  var score5 = (double.parse(stdin.readLineSync()));
  subjectCGPAValue.add(score5);
  cgpa.add(score5 / 10);

  for (var i = 0; i < cgpa.length; i++) {
    subjectCGPA += cgpa[i];
    finalSubjectCGPA = subjectCGPA / cgpa.length;
  }

  var cgpaPercentageValue = cgpaPercentageConstant * finalSubjectCGPA;

  print('Input: arr[] = $subjectCGPAValue');
  print('Input Subject: arr[] = $cgpa');
  print('Output: CGPA = $finalSubjectCGPA');
  print('Percentage = $cgpaPercentageValue');

}