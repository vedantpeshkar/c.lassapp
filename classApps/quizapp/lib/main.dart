import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State {
  List<Map> allQuestions = [
    {
      "question": "Who is the founder of Microsoft?",
      "options": ["Steve Jobs", "Bill Gates", "Lary Page", "Elon musk"],
      "correctAnswer": 1
    },
    {
      "question": "Who is the founder of Google?",
      "options": ["Steve Jobs", "Bill Gates", "Lary Page", "Elon musk"],
      "correctAnswer": 2
    },
    {
      "question": "Who is the founder of SpaceX?",
      "options": ["Steve Jobs", "Bill Gates", "Lary Page", "Elon musk"],
      "correctAnswer": 3
    },
    {
      "question": "Who is the founder of Apple?",
      "options": ["Steve Jobs", "Bill Gates", "Lary Page", "Elon musk"],
      "correctAnswer": 0
    },
    {
      "question": "Who is the founder of Meta?",
      "options": ["Steve Jobs", "Mark Zuckerberg", "Lary Page", "Elon musk"],
      "correctAnswer": 1
    },
  ];

  int currentQuestionIndex = 0;
  int selectedAnswerIndex = -1;
  int score = 0;
  bool questionPage = true;

  WidgetStateProperty<Color?> checkAnswer(int answerIndex) {
    if (selectedAnswerIndex != -1) {
      if (answerIndex == allQuestions[currentQuestionIndex]["correctAnswer"]) {
        return const WidgetStatePropertyAll(Colors.green);
      } else if (selectedAnswerIndex == answerIndex) {
        return const WidgetStatePropertyAll(Colors.red);
      } else {
        return const WidgetStatePropertyAll(null);
      }
    } else {
      return const WidgetStatePropertyAll(null);
    }
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      selectedAnswerIndex = -1;
      score = 0;
      questionPage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }

  Scaffold isQuestionScreen() {
    if (questionPage) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              children: [
                const SizedBox(width: 130),
                Text(
                  "Question : ${currentQuestionIndex + 1}/${allQuestions.length}",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 380,
              height: 50,
              child: Text(
                allQuestions[currentQuestionIndex]["question"],
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.purple,
                ),
              ),
            ),
            const SizedBox(height: 50),
            ...List.generate(4, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: SizedBox(
                  height: 50,
                  width: 350,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: checkAnswer(index),
                    ),
                    onPressed: () {
                      if (selectedAnswerIndex == -1) {
                        selectedAnswerIndex = index;
                        if (selectedAnswerIndex == allQuestions[currentQuestionIndex]["correctAnswer"]) {
                          score++;
                        }
                        setState(() {});
                      }
                    },
                    child: Text(
                      "${['A', 'B', 'C', 'D'][index]}. ${allQuestions[currentQuestionIndex]['options'][index]}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (selectedAnswerIndex != -1) {
              if (currentQuestionIndex < allQuestions.length - 1) {
                currentQuestionIndex++;
              } else {
                questionPage = false;
              }
              selectedAnswerIndex = -1;
              setState(() {});
            }
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.forward, color: Colors.white),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz Result",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://t4.ftcdn.net/jpg/05/93/91/27/360_F_593912714_6pEIEP3YlFQkbwknHEYxQzbne5ZN6BlE.jpg",
                height: 300,
              ),
              const SizedBox(height: 30),
              const Text(
                "Congratulations",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Score: $score/${allQuestions.length}",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: resetQuiz,
                child: const Text(
                  "Reset Quiz",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
