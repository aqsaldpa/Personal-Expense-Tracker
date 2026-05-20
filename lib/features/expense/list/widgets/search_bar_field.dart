import 'package:flutter/material.dart';

class SearchBarField extends StatelessWidget {
  const SearchBarField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: 'Search by title',
          prefixIcon: const Icon(Icons.search, size: 20),
          suffixIcon: controller.text.isEmpty
              ? null
              : IconButton(
                  icon: const Icon(Icons.clear, size: 18),
                  onPressed: () {
                    controller.clear();
                    onChanged('');
                    FocusScope.of(context).unfocus();
                  },
                ),
          isDense: true,
        ),
      ),
    );
  }
}
