import 'package:flutter/material.dart';
import 'package:breathe_app/features/breathe_screen/data/models/breathe_model.dart';

void showTechniquePicker({
  required BuildContext context,
  required List<BreatheModel> techniques,
  required int selectedIndex,
  required void Function(int) onSelected,
}) {
  showModalBottomSheet(
    context: context,
    builder: (_) => ListView.separated(
      padding: const EdgeInsets.all(10),
      itemCount: techniques.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            techniques[index].name,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          onTap: () {
            onSelected(index);
            Navigator.pop(context);
          },
        );
      },
    ),
  );
}
