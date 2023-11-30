import 'package:flutter/material.dart';
import 'package:flutter_app/provider/model/character.dart';
import 'package:flutter_app/screens/character_card.dart';

class CharacterList extends StatefulWidget {
  final List<Character>? characters;

  const CharacterList({super.key, this.characters});

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  @override
  Widget build(BuildContext context) {
    if (widget.characters != null) {
      return ListView.builder(
        itemCount: widget.characters!.length,
        itemBuilder: (context, index) {
          final Character character = widget.characters![index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CharacterScreen(character: character),
                ),
              );
            },
            child: ListTile(
              leading: Image.network(character.image),
              title: Text(character.name),
              subtitle: Text(character.status),
            ),
          );
        },
      );
    } else {
      return const Center(
        child: Text(
          'No characters found',
          style: TextStyle(fontSize: 30),
        ),
      );
    }
  }
}
