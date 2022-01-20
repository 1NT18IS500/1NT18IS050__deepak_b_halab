import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizzbrain.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            'Quizzler',
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  // List<String> questions = [
  //   'Australia is wider than the moon',
  //   'The tilt of Earth\'s axis has no effect on the length of the day',
  //   'One Earth rotation takes about 365 days',
  //   'Meteors are pieces of rock from space that enter Earth\'s atmosphere and because of friction appear as a streak of light',
  //   'As part of their training, Nasa staff watch the disaster movie Armageddon',
  //   'Nasa will pay you to lie in bed for months at a time',
  //   'Nasa was once sued for trespassing on Mars',
  //   'Before a mission, astronauts are able to choose from a menu of freeze-dried food, including a McDonald\'s Big Mac meal',
  //   'The first person to walk on the moon, Neil Armstrong, submitted his Nasa application two days late',
  //   'Nasa stands for National Aeronautics and Space Administration, but it was originally going to be called Missions of Orbital Operation Near Earth',
  //   'Mars is entirely inhabited by robots',
  //   'The Sun is the hottest star known',
  //   'The Moon is expanding',
  //   'The footprints on the Moon will be there for 100 million years',
  //   'One day on Venus is longer than one year on Venus',
  //   'There are about a billion stars in the Milky Way',
  //   'Space is completely silent'
  // ];
  // List<bool> answers = [
  //   true,
  //   true,
  //   false,
  //   true,
  //   true,
  //   true,
  //   true,
  //   false,
  //   false,
  //   false,
  //   true,
  //   false,
  //   false,
  //   true,
  //   true,
  //   false,
  //   true
  // ];
  int questionNumber = 0;
  int corrected = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 10,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionNumber].getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Divider(
          color: Colors.white,
          thickness: 4,
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                setState(() {
                  if (questions[questionNumber].getAnswer() == true) {
                    print('correct');
                    corrected++;
                    scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  } else {
                    scoreKeeper.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                    print('Incorrect');
                  }
                  questionNumber++;
                  if (questionNumber >= questions.length) {
                    Alert(
                      context: context,
                      type: AlertType.success,
                      title: '..Quizzler..\n $corrected/${scoreKeeper.length}',
                      desc: "You reached end of this Quizz..",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Yup..",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                        )
                      ],
                    ).show();
                    corrected = 0;
                    questionNumber = 0;
                    scoreKeeper.clear();
                  }
                });
                print('The user picked true.');
              },
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                setState(() {
                  if (questions[questionNumber].getAnswer() == false) {
                    print('correct');
                    corrected++;
                    scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                    //scoreKeeper.add();
                  } else {
                    scoreKeeper.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                    print('Incorrect');
                  }
                  questionNumber++;
                  if (questionNumber >= questions.length) {
                    Alert(
                      context: context,
                      type: AlertType.success,
                      title: '..Quizzler..\n $corrected/${scoreKeeper.length}',
                      desc: "You reached end of this Quizz..",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Yup..",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                        )
                      ],
                    ).show();
                    corrected = 0;
                    questionNumber = 0;
                    scoreKeeper.clear();
                  }
                });
                print('The user picked false.');
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: scoreKeeper,
          ),
        )
      ],
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("My title"),
    content: Text("This is my message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
