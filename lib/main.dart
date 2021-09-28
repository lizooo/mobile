import 'dart:math';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider(); 

          final index = i ~/ 2; 
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); 
          }
          return _buildRow(_suggestions[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    final punchLines = [
      "My girlfriend told me to stop making linkin park references. But in the end, it didn't even matter.",
      "I can't stand being in a wheelchair.",
      "A woman walks into a library and asked if they had any books about paranoia. Librarian: They're right behind you!!",
      "I know a lot of jokes about unemployed people but none of them work.",
      "Why do blind people hate skydiving? It scares the hell out of their dogs.",
      "At least this wasn't a blind joke. I can't see how those are funny.",
      "Never trust an atom. They make up everything.",
      "How can you spot a blind man at a nude beach? It isn't hard.",
      "It's hard to explain puns to kleptomaniacs because they always take things literally.",
      "Communism jokes aren't funny unless everyone gets them",
      "Why don't ants get sick? Because they have little antybodies.",
      "Shout out to the people who want to know what the opposite of in is",
      "A blind man walks into a bar. And a table. And a chair.",
      "A dyslexic walks into a bra.",
      "Hey do you want to hear a joke about construction? nevermind i'm still working on it",
      "I used to be addicted to soap, but now I'm clean...",
      "I poured root beer in a square glass. Now I just have beer.",
      "My girlfriend asked if I would stop listening to Oasis, I said maybe...",
      "Say what you want about deaf people."
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Neverending story: flutter edition'),
      ),
      body: _buildSuggestions(),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Add',
          child: Icon(Icons.cake_outlined),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Nice!"),
                  content: Text("You've been rewarded with a punchline. Click the button to claim your prize"),
                  actions: <Widget>[
                     TextButton(
                      child: Text("CLAIM"),
                      onPressed: () {
                        var snackBar = SnackBar(content: Text(punchLines[Random().nextInt(punchLines.length)]));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.of(context).pop();
                   },
                 ),
               ],
             );
           },
         );
      }),
    );
  }
}
