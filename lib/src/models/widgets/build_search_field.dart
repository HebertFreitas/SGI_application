import 'package:flutter/material.dart';

class BuildSearchField extends StatelessWidget {
  const BuildSearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
      child: TextField(
        style: const TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          hintText: 'Pesquisar',
          hintStyle: const TextStyle(color: Colors.black87),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black87,
          ),
          filled: true,
          fillColor: Colors.white12,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.black87),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.black87),
          ),
        ),
      ),
    );
  }
}
