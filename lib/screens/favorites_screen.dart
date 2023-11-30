import 'package:flutter/material.dart';
import 'package:flutter_app/persistence/repository/character_repository.dart';
import 'package:flutter_app/provider/model/character.dart';
import 'package:flutter_app/widgets/character_list.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  CharacterRepository characterRepository = CharacterRepository();
  List<Character>? characters;

  @override
  initState() {
    super.initState();
    initialize();
  }

  initialize() async {
    final favoriteCharacters = await characterRepository.getAll();

    if (mounted) {
      setState(() {
        characters = favoriteCharacters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CharacterList(characters: characters),
    );
  }
}
