import 'package:flutter/material.dart';

class CustomFormScaffold extends StatelessWidget {
  final Widget? title;
  final double? toolbarHeight;
  final Key? formKey;
  final Widget form;
  final Widget? drawer;
  final Widget? buttonChild;
  final List<Widget>? actions;
  final void Function()? submitForm;

  const CustomFormScaffold({
    this.title,
    required this.form,
    this.toolbarHeight,
    this.formKey,
    this.drawer,
    this.actions,
    this.submitForm,
    this.buttonChild,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer,
      appBar: AppBar(
        toolbarHeight: toolbarHeight,
        title: title,
        actions: actions,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: form,
              ),
              if(buttonChild!=null)
                SizedBox(height: 80),
            ],
          ),
        ),
      ),
      bottomSheet: buttonChild == null
          ? null
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        padding: const EdgeInsets.all(10),
                      ),
                      child: buttonChild,
                      onPressed: submitForm,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
