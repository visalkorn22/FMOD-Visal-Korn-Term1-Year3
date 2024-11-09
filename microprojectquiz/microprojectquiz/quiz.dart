import 'package:collection/collection.dart';

// Quiz Class to manage questions and participants
class Quiz {
  List<Question> questions = [];
  List<Participant> participants = [];

  // Method to add a question to the quiz
  void addQuestion(Question question) {
    questions.add(question);
  }

  // Method to add a participant to the quiz
  void addParticipant(Participant participant) {
    participants.add(participant);
  }

  // Method to calculate and display each participant's results
  void calculateResults() {
    for (var participant in participants) {
      participant.calculateScore(questions);
      print('${participant.firstName} ${participant.lastName} - Score: ${participant.score}');
    }
  }
}

// Abstract Question class to represent a question in the quiz
abstract class Question {
  String title;
  List<String> options;

  Question(this.title, this.options);

  // Abstract method to check if the answer is correct
  bool isCorrect(List<int> selectedOptions);

  // Method to display the question and options
  void displayQuestion() {
    print('\n$title');
    for (int i = 0; i < options.length; i++) {
      print('${i + 1}. ${options[i]}');
    }
  }
}

// SingleChoiceQuestion class to represent single-choice questions
class SingleChoiceQuestion extends Question {
  int correctAnswer;

  SingleChoiceQuestion(String title, List<String> options, this.correctAnswer)
      : super(title, options);

  @override
  bool isCorrect(List<int> selectedOptions) {
    return selectedOptions.length == 1 && selectedOptions[0] == correctAnswer;
  }
}

// MultipleChoiceQuestion class to represent multiple-choice questions
class MultipleChoiceQuestion extends Question {
  List<int> correctAnswers;

  MultipleChoiceQuestion(String title, List<String> options, this.correctAnswers)
      : super(title, options);

  @override
  bool isCorrect(List<int> selectedOptions) {
    // Sort both lists to ensure correct comparison
    return ListEquality().equals(correctAnswers..sort(), selectedOptions..sort());
  }
}

// Participant class to represent a quiz participant
class Participant {
  String firstName;
  String lastName;
  int score = 0;
  List<List<int>> answers; // Predefined answers for each question

  Participant(this.firstName, this.lastName, this.answers);

  // Method to calculate the participant's score
  void calculateScore(List<Question> questions) {
    for (int i = 0; i < questions.length; i++) {
      var question = questions[i];
      question.displayQuestion();
      var selectedOptions = answers[i];

      if (question.isCorrect(selectedOptions)) {
        score++;
      }

      print('Chosen answer(s): ${selectedOptions.map((idx) => idx + 1).join(", ")}');
    }
  }
}

void main() {
  Quiz quiz = new Quiz();

  // Adding questions to the quiz
  quiz.addQuestion(SingleChoiceQuestion(
      "What is Dart?", ["Language", "Game", "Bird"], 0));
  quiz.addQuestion(MultipleChoiceQuestion(
      "Which are fruits?", ["Apple", "Carrot", "Banana"], [0, 2]));

  // Adding participants with predefined answers
  var participant1 = Participant("John", "Doe", [
    [0],       // Answer for Question 1
    [0, 2]     // Answer for Question 2
  ]);

  var participant2 = Participant("Jane", "Smith", [
    [1],       // Answer for Question 1
    [0, 1, 2]  // Answer for Question 2
  ]);

  quiz.addParticipant(participant1);
  quiz.addParticipant(participant2);

  // Calculate and display results
  quiz.calculateResults();
}
