import 'package:flutter/material.dart';
import 'model/quiz.dart';
import 'Screen/question_screen.dart';
import 'Screen/result_screen.dart';
import 'Screen/welcome_screen.dart';

enum QuizState { notStarted, started, finished }

//Color appColor = Colors.blue[500] as Color;

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});

  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizState _quizState = QuizState.notStarted;
  int _currentQuestionIndex = 0; // Track the current question index
  List<String> _userAnswers = []; // Store user answers
  void _startQuiz() {
    setState(() {
      _quizState = QuizState.started;
      _currentQuestionIndex = 0; // Reset the question index
      _userAnswers = []; // Reset the answers
    });
  }

  void _answerQuestion(String userAnswer) {
    setState(() {
      // Save the user's answer
      _userAnswers.add(userAnswer);

      // Move to the next question or finish the quiz
      if (_currentQuestionIndex + 1 < widget.quiz.questions.length) {
        _currentQuestionIndex++;
      } else {
        _quizState = QuizState.finished;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen;
    switch (_quizState) {
      case QuizState.notStarted:
        currentScreen = WelcomeScreen(
          onStart: _startQuiz,
          quizTitle: widget.quiz.title,
        );
        break;
      case QuizState.started:
        currentScreen = QuestionScreen(
          question: widget.quiz.questions[_currentQuestionIndex],
          selectedAnswer: (String userAnswer) {
            // Process the answer
            _answerQuestion(userAnswer);
          },
        );
        break;
      case QuizState.finished:
        currentScreen = ResultScreen(
          quiz: widget.quiz,
          userAnswers: _userAnswers,
          onRestart: _startQuiz, // Restart the quiz
        );
        break;
    }
    return MaterialApp(
      home: Scaffold(
        body: currentScreen,
      ),
    );
  }
}
