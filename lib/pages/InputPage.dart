import 'package:flutter/material.dart';
import 'package:lab8/routes/list.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  TextEditingController _controller = TextEditingController();

  List<String> salom = [
    'lelho',
    'nagerch',
    'erfe',
    'onbutt',
    'dsrow',
    'eryal',
    'ipks',
    'lal',
    'oresc',
    'tterel'
  ];
  List<String> salom1 = [
    'hello',
    'changer',
    'free',
    'button',
    'words',
    'layer',
    'skip',
    'all',
    'score',
    'letter'
  ];
  var i = 0;
  var b = 0;
  bool _validate = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 64, 43, 182),
        title: Text('Unscramble'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${i + 1} of 10 words',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  'SCORE: ${b}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                  salom[i],
                  style: TextStyle(fontSize: 50),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
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
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your word',
                errorText: _validate ? null : 'Try Again!',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                minWidth: 167,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                onPressed: () {
                  setState(() {
                    if (i != 9) {
                      i++;
                    }
                  });
                },
                child: Text(
                  'SKIP',
                  style: TextStyle(color: Color.fromARGB(255, 54, 83, 177)),
                ),
              ),
              MaterialButton(
                minWidth: 167,
                color: Color.fromARGB(255, 54, 83, 177),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                onPressed: () {
                  setState(() {
                    if (_controller.text == salom1[i] && i != 9) {
                      i++;
                      b = b + 10;
                      print(i);
                    } else {
                      if (_controller.text == salom1[i]) {
                        i = 0;
                        b = 0;
                      } else {
                        i = i;
                        b = b;
                      }

                      if (i == 9) {
                        DialogWidget(context);
                      }
                    }
                  });
                  _controller.clear();
                  _controller.text.isEmpty
                      ? _validate = true
                      : _validate = false;
                },
                child: Text(
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

  DialogWidget(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text('Congratulations!'),
      content: Text('your scored: $b'),
      actions: [
        TextButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).pop(false);
              });
            },
            child: Text('EXIT')),
        TextButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).pop(i = 0);
                b = 0;
              });
            },
            child: Text('PLAY AGAIN')),
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
