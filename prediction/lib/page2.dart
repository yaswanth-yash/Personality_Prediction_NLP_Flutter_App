import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prediction/helpers/api_caller.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  String q1 =
      "Q1. You joined a new company and it's your first day there. No one seems interested in helping or starting conversation with you.What You will do..";
  String q2 =
      "Q2. Do you like working in a team or performing individually? Explain Why? ";
  String q3 =
      "Q3. When you encounter an unknown problem, do you rely on facts or try to generate new possibilities? Explain. ";
  String q4 =
      "Q4. You are assigned with difficult project with very short deadline, what will be your strategy?";
  String q5 =
      "Q5. How do you influence other people: Strong emotional appeal or great logical explanation? Explain why? ";
  String q6 =
      "Q6. In an emergency situation, like a fire, how are you likely to react? (assume you're the only one involved)";
  String q7 =
      "Q7. Do you like to make decisions quickly or do you like to take your time to look at it from different sides? ";
  String q8 =
      " Q8. Consider youself the leader of an important project but your suboordinated are not cooperating with you and not following your instructions seriously. What would be your approach? ";
  TextEditingController A1 = TextEditingController();
  TextEditingController A2 = TextEditingController();
  TextEditingController A3 = TextEditingController();
  TextEditingController A4 = TextEditingController();
  TextEditingController A5 = TextEditingController();
  TextEditingController A6 = TextEditingController();
  TextEditingController A7 = TextEditingController();
  TextEditingController A8 = TextEditingController();
  String predictedPersonality = "";
  bool isFetching = false;
  bool showPersonalityBagImage = false;
  bool showAccuracyGraphImage = false;

  void get_personality() async {
    for (TextEditingController data in [A1, A2, A3, A4, A5, A6, A7, A8]) {
      if (data.text.isEmpty) {
        final snackBar = SnackBar(
          content: Text("Please answer all the questions."),
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }
    }
    setState(() {
      isFetching = true;
    });
    String answer = A1.text +
        A2.text +
        A3.text +
        A4.text +
        A5.text +
        A6.text +
        A7.text +
        A8.text;
    Map<String, dynamic> reponse =
        await PredictionAPIs.get_personality_type(answer);
    setState(() {
      predictedPersonality = reponse['personality'];
      isFetching = false;
      print(predictedPersonality);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Questionnaire"),
          backgroundColor: Colors.blue,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 10, 33, 116),
                Color.fromARGB(255, 83, 69, 206),
              ]),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(40),
          child: predictedPersonality == ""
              ? !isFetching
                  ? Column(
                      children: [
                        Container(
                          // decoration: BoxDecoration(
                          //   image: DecorationImage(
                          //     image: NetworkImage(
                          //       'https://thumbs.gfycat.com/DefensiveMajorApisdorsatalaboriosa-max-1mb.gif',
                          //     ),
                          //     fit: BoxFit.fill,
                          //   ),
                          // ),
                          child: Image(
                            height: MediaQuery.of(context).size.width / 1.5,
                            width: MediaQuery.of(context).size.width / 1.5,
                            image: NetworkImage(
                              'https://thumbs.gfycat.com/DefensiveMajorApisdorsatalaboriosa-max-1mb.gif',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 30)),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text("$q1",
                              style: TextStyle(
                                  fontSize: 20, fontFamily: "Concert")),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        TextField(
                          controller: A1,
                          keyboardType: TextInputType.multiline,
                          maxLines: 2,
                          decoration: InputDecoration(
                              hintText: "Your Answer",
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.blue))),
                        ),
                        Padding(padding: EdgeInsets.only(top: 30)),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text("$q2", style: TextStyle(fontSize: 20)),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        TextField(
                          controller: A2,
                          keyboardType: TextInputType.multiline,
                          maxLines: 2,
                          decoration: InputDecoration(
                              hintText: "Your Answer",
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.blue))),
                        ),
                        Padding(padding: EdgeInsets.only(top: 30)),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text("$q3", style: TextStyle(fontSize: 20)),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        TextField(
                          controller: A3,
                          keyboardType: TextInputType.multiline,
                          maxLines: 2,
                          decoration: InputDecoration(
                              hintText: "Your Answer",
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.blue))),
                        ),
                        Padding(padding: EdgeInsets.only(top: 30)),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "$q4",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        TextField(
                          controller: A4,
                          keyboardType: TextInputType.multiline,
                          maxLines: 2,
                          decoration: InputDecoration(
                              hintText: "Your Answer",
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.blue))),
                        ),
                        Padding(padding: EdgeInsets.only(top: 30)),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text("$q5", style: TextStyle(fontSize: 20)),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        TextField(
                          controller: A5,
                          keyboardType: TextInputType.multiline,
                          maxLines: 2,
                          decoration: InputDecoration(
                              hintText: "Your Answer",
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.blue))),
                        ),
                        Padding(padding: EdgeInsets.only(top: 30)),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text("$q6", style: TextStyle(fontSize: 20)),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        TextField(
                          controller: A6,
                          keyboardType: TextInputType.multiline,
                          maxLines: 2,
                          decoration: InputDecoration(
                              hintText: "Your Answer",
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.blue))),
                        ),
                        Padding(padding: EdgeInsets.only(top: 30)),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text("$q7", style: TextStyle(fontSize: 20)),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        TextField(
                          controller: A7,
                          keyboardType: TextInputType.multiline,
                          maxLines: 2,
                          decoration: InputDecoration(
                              hintText: "Your Answer",
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.blue))),
                        ),
                        Padding(padding: EdgeInsets.only(top: 30)),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text("$q8", style: TextStyle(fontSize: 20)),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        TextField(
                          controller: A8,
                          keyboardType: TextInputType.multiline,
                          maxLines: 2,
                          decoration: InputDecoration(
                              hintText: "Your Answer",
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.blue))),
                        ),
                        Padding(padding: EdgeInsets.only(top: 60)),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                            gradient: LinearGradient(colors: [
                              Color.fromARGB(255, 83, 69, 206),
                              Color.fromARGB(255, 10, 33, 116)
                            ]),
                          ),
                          height: 44.0,
                          child: ElevatedButton(
                            onPressed: () {
                              get_personality();
                            },
                            //  style: ElevatedButton.styleFrom(
                            // backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
                            child: Text(
                              'Start Prediction',
                              style: TextStyle(letterSpacing: 3),
                            ),
                          ),
                        )
                      ],
                    )
                  : Center(child: CircularProgressIndicator.adaptive())
              : Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SelectableText.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'As per your answers, your ',
                                style: TextStyle(
                                    fontSize: 21, fontStyle: FontStyle.italic)),
                            TextSpan(
                                text: 'predicted personality ',
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 83, 69, 206))),
                            TextSpan(
                                text: 'type is: ',
                                style: TextStyle(
                                    fontSize: 21, fontStyle: FontStyle.italic)),
                            TextSpan(
                                text: predictedPersonality,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 26)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Wrap(
                        spacing: 100,
                        runSpacing: 20,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runAlignment: WrapAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 10, 33, 116),
                                Color.fromARGB(255, 83, 69, 206)
                              ]),
                            ),
                            height: 44.0,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  showPersonalityBagImage = true;
                                  showAccuracyGraphImage = false;
                                });
                              },
                              //style: ElevatedButton.styleFrom(
                              //  backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
                              child: Text(
                                'Get Personailty Word Bag',
                                style: TextStyle(letterSpacing: 3),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 32, 61, 108),
                                Color.fromARGB(255, 49, 19, 80)
                              ]),
                            ),
                            height: 44.0,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  showAccuracyGraphImage = true;
                                  showPersonalityBagImage = false;
                                });
                              },
                              //style: ElevatedButton.styleFrom(
                              //  backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
                              child: Text(
                                'Get Personailty Prediction Graph',
                                style: TextStyle(letterSpacing: 3),
                              ),
                            ),
                          )
                        ],
                      ),
                      if (showPersonalityBagImage)
                        Container(
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: MediaQuery.of(context).size.height / 1.1,
                          child: InteractiveViewer(
                            panEnabled: false, // Set it to false
                            boundaryMargin: EdgeInsets.all(10),
                            minScale: 0.2,
                            maxScale: 4,
                            child: CachedNetworkImage(
                                imageUrl:
                                    "https://predictpersonality.herokuapp.com/personality/wordbag?bag=$predictedPersonality",
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                fit: BoxFit.fitHeight,
                                filterQuality: FilterQuality.high),
                          ),
                        ),
                      if (showAccuracyGraphImage)
                        Container(
                          margin: EdgeInsets.only(top: 130),
                          child: InteractiveViewer(
                            boundaryMargin: EdgeInsets.zero,
                            minScale: 0.1,
                            maxScale: 4.6,
                            child: CachedNetworkImage(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height / 2.8,
                                imageUrl:
                                    "https://predictpersonality.herokuapp.com/accuracy/image?image_name=accuracy",
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                fit: BoxFit.fitHeight,
                                filterQuality: FilterQuality.high),
                          ),
                        ),
                    ],
                  ),
                ),
        ));
  }
}
