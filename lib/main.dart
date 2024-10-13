import 'package:flutter/material.dart';

void main() {
  runApp(const HomeScreen());
}

String calculate(int score) {
  String result = "";
  if (score >= 90) result = "A";
  else if (score >= 80) result = "B";
  else if (score >= 70) result = "C";
  else if (score >= 60) result = "D";
  else result = "F";

  return result;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String result = "";
  int score = 0;
  final TextEditingController gradeInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Grade Calculator"),
            backgroundColor: Colors.pink,
            centerTitle: true,
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                
                children: [
                  Container(
                    margin: const EdgeInsets.all(50.0),
                    child: SizedBox(
                      width: 200,
                      child: TextField(
                        controller: gradeInput,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.percent),
                          prefixIconColor: Colors.pink,
                          hintText: "Type your Grade",
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(90))),
                          
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(50.0),
                    child: TextButton(
                      onPressed: () {
                        var input = int.parse(gradeInput.text);
                        result = calculate(input);
                        setState(() {});
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.pink,
                        padding: const EdgeInsets.all(32.0),
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)))
                      ), 
                      child: const Text("Calculate", style: TextStyle(color: Colors.white),)
                    ),
                  ),
        
                  Text(result, style: const TextStyle(fontSize: 36.0, color: Colors.pink))
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}