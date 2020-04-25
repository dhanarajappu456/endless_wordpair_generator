import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DemoApp',
      home: Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          //child: Text('hellegrygegrheho kjdsfsfsfsfckkttjrworld',style: TextStyle(color: Colors.white),),
          child: RandomWords(),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final double _biggerFont = 18;
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();
 
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Startgenerator',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd) {
        return Divider(
          thickness: 5,
        );
      }
      
      final index = i ~/ 2;

      if (index >= _suggestions.length) {
         // int ji;
         // ji=_suggestions.length;
        // return Text(index.toString());
        //  return Text(ji.toString());
        _suggestions.addAll(generateWordPairs().take(10));
      }
      //return Text(index.toString()+i.toString());
      return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(WordPair pair) {
    

    return ListTile(
      
      title: Text(
     
              
        pair.asPascalCase,
        style:TextStyle(fontSize: _biggerFont, color: Color(0xff0000ff)),
              
      
      ),
    );
  }
}
