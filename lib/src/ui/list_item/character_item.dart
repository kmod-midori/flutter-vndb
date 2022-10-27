import 'package:flt_vndb/src/api/character.dart';
import 'package:flt_vndb/src/widgets/thumbnail.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Character item;

  final void Function()? onTap;

  const CharacterItem(this.item, {this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item.image != null)
              SizedBox(
                width: 100,
                child: VisualNovelThumbnail(item.image!),
              ),
            Expanded(
              child: ListTile(
                title: Text(item.name),
                subtitle: item.original != null ? Text(item.original!) : null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
