import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebamarvel/characters/viewmodel/characters_viewmodel.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CharactersViewModel viewModel =
        Provider.of<CharactersViewModel>(context, listen: true);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Marvel App'),
        ),
        body: viewModel.isLoading
            ? const LinearProgressIndicator()
            : ListView.builder(
                itemBuilder: (_, index) => Container(
                      margin: const EdgeInsets.all(14),
                      child: Text(viewModel.characters[index].name ?? ''),
                    ),
                itemCount: viewModel.characters.length));
  }
}
