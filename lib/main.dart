import 'package:flutter/material.dart';
import 'package:http/http.dart';


void main()
{
  runApp( MyApp() );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final myController = TextEditingController();


  @override
  void initState() {
    super.initState();

    myController.addListener(_printLatestValue);



    _controller = AnimationController(vsync: this);
  }

  void _printLatestValue() {
    print('Second text field: ${myController.text}');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Makna App'),
        ),
        body: MaknaForm(),
      ),
    );
    // return Container();
  }

}


class MaknaForm extends StatelessWidget {

  MaknaForm({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Center(
          child: Container(
            child: const Text('Cari Maksud Perkataan di sini 👋'),
            margin: const EdgeInsets.all(80),
            ),
          ),


         Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Cari Makna Perkataan Di Sini',
            ),

          ),
        ),
        Center(
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Mencari Makna Perkataan'),
                    )
                );
              },
              child: const Text('Cari Makna'),
            )
        ),

      ],
    );
  }
}

