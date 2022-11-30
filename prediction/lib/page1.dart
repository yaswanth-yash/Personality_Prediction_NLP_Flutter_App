import 'package:flutter/material.dart';
import 'package:prediction/page2.dart';

class Page1 extends StatefulWidget {
  const Page1({Key key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("Mini Project"),
        //   backgroundColor: Colors.blue,
        // ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              DefaultTextStyle(
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black, fontStyle: FontStyle.normal, fontFamily: 'Saint'),
                  child: Text("Personality Prediction Using NLP")),
              Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                width: 1400,
                height: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://archive.factordaily.com/wp-content/uploads/2018/01/Frrole_Lead.gif',
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Column(children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 5)),
                const ExpansionTile(
                  iconColor: Color.fromARGB(255, 13, 31, 145),
                  initiallyExpanded: true,
                  title: Text('About the Project', style: TextStyle(color: Colors.black, fontSize: 18),),
                  subtitle: Text('Personality Prediction', style: TextStyle(color: Color.fromARGB(255, 13, 31, 145), fontWeight: FontWeight.bold),),
                  children: <Widget>[
                    ListTile(
                        title: Text(
                            'Personality Prediction System for applicants using Questionnaire with Natural Language Processing. This Project follows the principle of MBTI as a guideline’s so that it helps to identify the personality of the user based on the following personality dimensions: Introvert (I) and Extrovert (E), Sensation(A) and Intuition(N), Thinking(T) and Feeling(F), Perceiving(P) and Judging(J). The combination of the above four types of personality dimensions will result in sixteen types of personality such as "INFJ" or "ENTP" etc., each of which describe certain personality traits of a person. The objectives are, to learn and implement the concepts of data mining and data warehousing and to apply suitable algorithms to classify candidates into different personality types based on their resume and questionnaire responses.')),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
              ]),
              SizedBox(height: 20),
              Text(
                "Start Predicting Your Personality",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 18,
                    height: 2, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                    color: Color.fromARGB(255, 59, 69, 209), //font color
                    letterSpacing: 5, //letter spacing
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 20),
              Tooltip(
                message:
                    "When you click on this button you'd be redirected to a screen consisiting of 8 Questions, \n submitting answer for those question will help us to predict your personality.",
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    gradient: LinearGradient(colors: [Color.fromARGB(255, 83, 69, 206), Color.fromARGB(255, 10, 33, 116)]),
                  ),
                  height: 44.0,
                  width: 130,
                  child: ElevatedButton(
                    onPressed: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
                    child: Text('Start'),
                  ),
                )
              ),
              SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(right: 10),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "By",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Shantanu Yadav",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "&",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Yaswanth Varma",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
