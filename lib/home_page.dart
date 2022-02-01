import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var textEditingForWeight = TextEditingController();
  var textEditingForName = TextEditingController();
  int groupValue = 0;
  double finalResult = 0.0;
  String _formateText = '';

  void onChanged(value) {
    setState(() {
      groupValue = value;

      switch (groupValue) {
        case 0:
          finalResult = calculator(textEditingForWeight.text.toString(), 0.06);
          _formateText =
          'your weight on Pluto is ${finalResult.toStringAsFixed(1)} ';
          break;
        case 1:
          finalResult = calculator(textEditingForWeight.text.toString(), 0.38);
          _formateText =
          'your weight on Mars is ${finalResult.toStringAsFixed(1)} ';
          break;
        case 2:
          finalResult = calculator(textEditingForWeight.text.toString(), 0.91);
          _formateText =
          'your weight on Venus is ${finalResult.toStringAsFixed(1)}  ';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            width: 300,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/planet.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: textEditingForName,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'name',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  controller: textEditingForWeight,
                  decoration: const InputDecoration(

                    hintText: 'In Pound',
                    hintStyle: TextStyle(
                      color: Colors.grey,

                    ),
                  ),
                  onChanged: (text) {
                    setState(() {

                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio<int>(
                  activeColor: Colors.brown,
                  value: 0,
                  groupValue: groupValue,
                  onChanged: (onChanged)),
              const Text(
                'Pluto',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Radio<int>(
                  activeColor: Colors.red,
                  value: 1,
                  groupValue: groupValue,
                  onChanged: (onChanged)),
              const Text(
                'Mars',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Radio<int>(
                  activeColor: Colors.orangeAccent,
                  value: 2,
                  groupValue: groupValue,
                  onChanged: (onChanged)),
              const Text(
                'Venus',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text((textEditingForWeight.text
                .toString()
                .isEmpty) ? "please provide your weight" : _formateText +
                '${textEditingForName.text.toString()}',),
          ),
        ],
      ),
    );
  }

  double calculator(String weight, double d) {
    if (int
        .parse(weight)
        .toString()
        .isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * d;
    } else {
      return int.parse('180') * 0.38;
    }
  }
}
