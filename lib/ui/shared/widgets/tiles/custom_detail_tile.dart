import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return Container(
      height: 52,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 0.5,
        ),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextField(
                enabled: false,
                readOnly: true,
                decoration: InputDecoration(
                  label: Text("$detailName: ${detailData ?? "Sem dados"}"),
                  labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  prefixIcon: Icon(
                    icon,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          if (copyable)
            IconButton(
              iconSize: 25,
              onPressed: () {
                Clipboard.setData(
                  new ClipboardData(text: "$detailData"),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Text("$detailName copiado!"),
                  ),
                );
              },
              icon: Icon(
                Icons.copy_outlined,
              ),
            ),
        ],
      ),
    );
  }
}
