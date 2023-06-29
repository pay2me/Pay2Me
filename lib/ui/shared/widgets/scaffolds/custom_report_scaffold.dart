import 'package:flutter/material.dart';

class CustomReportScaffold extends StatelessWidget {
  final String reportName;
  final Widget? body;
  final void Function()? onSaved;
  final void Function()? onRefresh;

  CustomReportScaffold({
    required this.reportName,
    this.body,
    required this.onSaved,
    this.onRefresh,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(reportName),
          actions: [
            if(onRefresh!=null)
              IconButton(
                icon: const Icon(
                  Icons.refresh_outlined,
                  size: 30,
                ),
                onPressed: onRefresh,
              ),
            IconButton(
              icon: const Icon(
                Icons.save_alt_outlined,
                size: 30,
              ),
              onPressed: onSaved,
            ),
          ],
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: Theme.of(context).iconTheme,
        ),
        body: body,
      );
  }
}
