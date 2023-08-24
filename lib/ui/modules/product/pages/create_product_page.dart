import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pay_2_me/ui/modules/product/export_product.dart';
import 'package:pay_2_me/ui/shared/widgets/fields/custom_textFormField_container_field.dart';
import 'package:pay_2_me/ui/shared/widgets/scaffolds/custom_form_scaffold.dart';
import 'package:provider/provider.dart';

class CreateProductPage extends StatelessWidget {
  const CreateProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<CreateProductStore>(context, listen: false);

    return Observer(
      builder: (context) => CustomFormScaffold(
        formKey: store.formKey,
        title: const Text("Cadastro"),
        submitForm: () => store.submitCreateForm(context),
        buttonChild: store.isLoading
            ? const CircularProgressIndicator(
                color: Colors.white, strokeWidth: 2)
            : const Text(
                "Salvar",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
        form: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
              child: Text(
                "Produto",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormContainerField(
                    labelText: "Nome",
                    isWrong: !(store.validityOfFields["Nome"] ?? true),
                    onTap: () => store.validityOfFields["Nome"] = true,
                    onChanged: (value) => store.validityOfFields["Nome"] = true,
                    onSaved: (value) => store.productToForm.productDescription = value,
                    validator: (value) => store.fieldValidator(context, "Nome", value, false),
                  ),
                ),
                Expanded(
                  child: CustomTextFormContainerField(
                    labelText: "Preço (em centavos)",
                    isWrong: !(store.validityOfFields["Preço"] ?? true),
                    onTap: () => store.validityOfFields["Preço"] = true,
                    onChanged: (value) =>store.validityOfFields["Preço"] = true,
                    onSaved: (value) => store.productToForm.productPrice = num.tryParse(value??""),
                    validator: (value) => store.fieldValidator(context, "Preço", value, false),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
