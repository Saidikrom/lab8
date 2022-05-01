// ignore_for_file: file_names

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:lab8/routes/list.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController _controller = TextEditingController();

  List<String> words = [
    'lelho',
    'nagerch',
    'erfe',
    'onbutt',
    'dsrow',
    'eryal',
    'ipks',
    'lal',
    'oresc',
    'tterel',
    'tterel'
  ];
  List<String> words1 = [
    'hello',
    'changer',
    'free',
    'button',
    'words',
    'layer',
    'skip',
    'all',
    'score',
    'letter',
    'letter'
  ];
  var i = 0;
  var b = 0;
  var x = 0;
  bool _validate = false;
  void wordChage() {
    setState(() {
      // ignore: unnecessary_null_comparison
      if (_controller.text == words1[i] && _controller.text != null) {
        _validate = false;
      } else {
        _validate = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 54, 83, 177),
        title: const Text('Unscramble'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  i == 10 ? '${i} of 10 words' : '${i + 1} of 10 words',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  'SCORE: $b',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  words[i],
                  style: const TextStyle(fontSize: 50),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'Unscramble the word using all the letters.',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: TextFormField(
                controller: _controller,
                decoration: _validate
                    ? const InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                        hintText: 'Enter your word',
                        errorBorder: OutlineInputBorder(),
                        errorText: 'Try again')
                    : const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your word',
                      )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                minWidth: 167,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                onPressed: () {
                  setState(() {
                    if (i != 9) {
                      i++;
                    }
                  });
                },
                child: const Text(
                  'SKIP',
                  style: TextStyle(color: Color.fromARGB(255, 54, 83, 177)),
                ),
              ),
              MaterialButton(
                minWidth: 167,
                color: const Color.fromARGB(255, 54, 83, 177),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                onPressed: () {
                  setState(() {
                    wordChage();
                    if (_controller.text == words1[i] && i != 10) {
                      i++;
                      b = b + 10;
                    } else {
                      if (_controller.text != words1[i]) {
                        i = i;
                        b = b;
                      }
                    }
                    if (i == 9 || i == 10) {
                      DialogWidget(context);
                    }
                    _controller.clear();
                  });
                },
                child: const Text(
                  'SUBMIT',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  DialogWidget(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: const Text('Congratulations!'),
      content: Text('your scored: $b'),
      actions: [
        TextButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).pop(false);
              });
            },
            child: const Text('EXIT')),
        TextButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).pop(i = 0);
                b = 0;
              });
            },
            child: const Text('PLAY AGAIN')),
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
