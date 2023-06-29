import 'package:flutter/material.dart';

class CustomDetailCompositeTile {
  final IconData icon;
  final String title;
  final String? data;

  CustomDetailCompositeTile({
    required this.icon,
    required this.title,
    this.data,
  });
}

class DetailComposedTileWidget extends StatelessWidget {
  final List<CustomDetailCompositeTile> datas;

  const DetailComposedTileWidget({
    required this.datas,
    Key? key,
  }) : super(key: key);

  List<Widget> getDatas(BuildContext context) {
    List<Widget> datas = [];
    for (CustomDetailCompositeTile data in this.datas) {
      datas.add(
        Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: 82,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 0.5,
            ),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                data.icon,
                color: Theme.of(context).colorScheme.primary,
                size: 25,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    data.title,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    data.data ?? "Sem Dados",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
    return datas;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: getDatas(context),
    );
  }
}
