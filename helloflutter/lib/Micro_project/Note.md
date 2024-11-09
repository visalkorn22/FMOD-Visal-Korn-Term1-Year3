Quiz (class)

Attributes:
questions: List<Question>
results: List<Result>
Methods:
addQuestion(Question)
calculateScore(Participant): int



Question (abstract class)

Attributes:
title: String
options: List<String>
Methods:
checkAnswer(answer): bool (abstract)

SingleChoice (class inherits from Question)

Attributes:
correctAnswer: String

MultipleChoice (class inherits from Question)

Attributes:
correctAnswers: List<String>

Participant (class)

Attributes:
firstName: String
lastName: String

Result(class)

Attributes:
participant: Participant
score: int