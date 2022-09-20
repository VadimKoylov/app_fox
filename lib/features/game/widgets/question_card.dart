import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final Map<String, String?> answers;
  final void Function(String?)? onChanged;
  final String value;

  const QuestionCard({
    required this.answers,
    required this.onChanged,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (answers['answer_a'] != null)
          RadioListTile<String>(
            title: Text(
              answers['answer_a']!,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: false,
            ),
            value: answers['answer_a']!,
            groupValue: value,
            onChanged: onChanged,
          ),
        if (answers['answer_b'] != null)
          RadioListTile<String>(
            title: Text(
              answers['answer_b']!,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: false,
            ),
            value: answers['answer_b']!,
            groupValue: value,
            onChanged: onChanged,
          ),
        if (answers['answer_c'] != null)
          RadioListTile<String>(
            title: Text(
              answers['answer_c']!,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: false,
            ),
            value: answers['answer_c']!,
            groupValue: value,
            onChanged: onChanged,
          ),
        if (answers['answer_d'] != null)
          RadioListTile<String>(
            title: Text(
              answers['answer_d']!,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: false,
            ),
            value: answers['answer_d']!,
            groupValue: value,
            onChanged: onChanged,
          ),
        if (answers['answer_e'] != null)
          RadioListTile<String>(
            title: Text(
              answers['answer_e']!,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: false,
            ),
            value: answers['answer_e']!,
            groupValue: value,
            onChanged: onChanged,
          ),
        if (answers['answer_f'] != null)
          RadioListTile<String>(
            title: Text(
              answers['answer_f']!,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: false,
            ),
            value: answers['answer_f']!,
            groupValue: value,
            onChanged: onChanged,
          ),
      ],
    );
  }
}
