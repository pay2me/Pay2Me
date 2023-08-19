import 'package:flutter/material.dart';

class CustomDetailTile extends StatelessWidget {
  final IconData? icon;
  final String? detailName;
  final Object? detailData;
  final bool copyable;

  const CustomDetailTile({
    this.icon,
    this.detailName,
    this.detailData,
    this.copyable = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            "$detailName",
            style: TextStyle(
              color: Theme.of(context).colorScheme.shadow,
              fontSize: 20,
            ),
          ),
          SelectableText(
            "$detailData",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
