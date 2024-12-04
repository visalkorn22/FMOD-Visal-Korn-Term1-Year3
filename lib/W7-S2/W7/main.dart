import 'package:flutter/material.dart';
import 'quiz_app.dart';
import 'model/quiz.dart';

void main() {
  Question q1 = const Question(
      title: "Who is the best teacher?",
      possibleAnswers: ["Ronan", "LeeSinh", 'Sengly'],
      goodAnswer: 'Ronan');
  Question q2 = const Question(
      title: "Which color is the best?",
      possibleAnswers: ["Blue", "Red", 'Green'],
      goodAnswer: 'Green');
  Question q3 = const Question(
      title: "What is the capital of France?",
      possibleAnswers: ["Paris", "London", "Berlin"],
      goodAnswer: "Paris");
  Question q4 = const Question(
      title: "What is 5 + 3?",
      possibleAnswers: ["6", "7", "8"],
      goodAnswer: "8");

  Question q5 = const Question(
      title: "Which planet is known as the Red Planet?",
      possibleAnswers: ["Mars", "Jupiter", "Venus"],
      goodAnswer: "Mars");

  Question q6 = const Question(
      title: "Who wrote 'Romeo and Juliet'?",
      possibleAnswers: ["William Shakespeare", "Charles Dickens", "Mark Twain"],
      goodAnswer: "William Shakespeare");

  Question q7 = const Question(
      title: "What is the largest ocean on Earth?",
      possibleAnswers: ["Atlantic Ocean", "Indian Ocean", "Pacific Ocean"],
      goodAnswer: "Pacific Ocean");

  Question q8 = const Question(
      title: "Which programming language is used for Flutter?",
      possibleAnswers: ["Dart", "JavaScript", "Python"],
      goodAnswer: "Dart");

  List<Question> myQuestions = [q1, q2, q3, q4, q5, q6, q7, q8];
  Quiz myQuiz = Quiz(title: "Crazy Quizz", questions: myQuestions);

  runApp(QuizApp(myQuiz));
}
