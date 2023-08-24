import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/ui/modules/payer/export_payer.dart';
import 'package:pay_2_me/ui/shared/widgets/fields/custom_datePicker_field.dart';
import 'package:pay_2_me/ui/shared/widgets/fields/custom_dropdown_container_field.dart';
import 'package:pay_2_me/ui/shared/widgets/fields/custom_textFormField_container_field.dart';
import 'package:pay_2_me/ui/shared/widgets/scaffolds/custom_form_scaffold.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class UpdatePayerPage extends StatelessWidget {
  const UpdatePayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<UpdatePayerStore>(context, listen: false);

    final maskPhone = MaskTextInputFormatter(
        mask: "+55 (##) #####-####", filter: {"#": RegExp(r'[0-9]')});
    final maskCPF = MaskTextInputFormatter(
        mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
    final maskCEP = MaskTextInputFormatter(
        mask: "#####-###", filter: {"#": RegExp(r'[0-9]')});

    TextEditingController valueController = TextEditingController();
    TextEditingController dueDateController = TextEditingController();

    return FutureBuilder(
      future: store.loadUpdateCliente(context),
      builder: (ctx, snapshot) => Observer(
          builder: (context) => CustomFormScaffold(
            formKey: store.formKey,
            title: const Text("Cadastro"),
            submitForm: () => store.submitUpdateForm(context),
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
                    "Cliente",
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
                        onSaved: (value) => store.payerToForm.payerName = value,
                        validator: (value) =>
                            store.fieldValidator(context, "Nome", value, false),
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormContainerField(
                        labelText: "Telefone",
                        inputFormatters: [maskPhone],
                        isWrong: !(store.validityOfFields["Telefone"] ?? true),
                        onTap: () => store.validityOfFields["Telefone"] = true,
                        onChanged: (value) =>
                            store.validityOfFields["Telefone"] = true,
                        onSaved: (value) => store.payerToForm.payerPhone = value,
                        validator: (value) =>
                            store.fieldValidator(context, "Telefone", value, false),
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormContainerField(
                        labelText: "CPF",
                        inputFormatters: [maskCPF],
                        isWrong: !(store.validityOfFields["CPF"] ?? true),
                        onTap: () => store.validityOfFields["CPF"] = true,
                        onChanged: (value) => store.validityOfFields["CPF"] = true,
                        onSaved: (value) => store.payerToForm.payerCpf = value,
                        validator: (value) =>
                            store.fieldValidator(context, "CPF", value, false),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormContainerField(
                        labelText: "Cidade",
                        isWrong: !(store.validityOfFields["Cidade"] ?? true),
                        onTap: () => store.validityOfFields["Cidade"] = true,
                        onChanged: (value) =>
                            store.validityOfFields["Cidade"] = true,
                        onSaved: (value) =>
                            store.payerToForm.payerAddress!.addressCity = value,
                        validator: (value) =>
                            store.fieldValidator(context, "Cidade", value, false),
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormContainerField(
                        labelText: "Estado",
                        isWrong: !(store.validityOfFields["Estado"] ?? true),
                        onTap: () => store.validityOfFields["Estado"] = true,
                        onChanged: (value) =>
                            store.validityOfFields["Estado"] = true,
                        onSaved: (value) =>
                            store.payerToForm.payerAddress!.addressState = value,
                        validator: (value) =>
                            store.fieldValidator(context, "Estado", value, false),
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormContainerField(
                        labelText: "Bairro",
                        isWrong: !(store.validityOfFields["Bairro"] ?? true),
                        onTap: () => store.validityOfFields["Bairro"] = true,
                        onChanged: (value) =>
                            store.validityOfFields["Bairro"] = true,
                        onSaved: (value) => store
                            .payerToForm.payerAddress!.addressNeighborhood = value,
                        validator: (value) =>
                            store.fieldValidator(context, "Bairro", value, false),
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormContainerField(
                        labelText: "CEP",
                        inputFormatters: [maskCEP],
                        isWrong: !(store.validityOfFields["CEP"] ?? true),
                        onTap: () => store.validityOfFields["CEP"] = true,
                        onChanged: (value) => store.validityOfFields["CEP"] = true,
                        onSaved: (value) =>
                            store.payerToForm.payerAddress!.addressCEP = value,
                        validator: (value) =>
                            store.fieldValidator(context, "CEP", value, false),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormContainerField(
                        labelText: "Descrição do endereço",
                        isWrong: !(store.validityOfFields["Descrição do endereço"] ?? true),
                        onTap: () => store.validityOfFields["Descrição do endereço"] = true,
                        onChanged: (value) => store.validityOfFields["Descrição do endereço"] = true,
                        onSaved: (value) => store.payerToForm.payerAddress!.addressDescription = value,
                        validator: (value) => store.fieldValidator(context, "Descrição do endereço", value, false),
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormContainerField(
                        labelText: "Rua",
                        isWrong: !(store.validityOfFields["Rua"] ?? true),
                        onTap: () => store.validityOfFields["Rua"] = true,
                        onChanged: (value) => store.validityOfFields["Rua"] = true,
                        onSaved: (value) => store.payerToForm.payerAddress!.addressStreet = value,
                        validator: (value) => store.fieldValidator(context, "Rua", value, false),
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormContainerField(
                        labelText: "Número da casa",
                        isWrong: !(store.validityOfFields["Número da casa"] ?? true),
                        onTap: () => store.validityOfFields["Número da casa"] = true,
                        onChanged: (value) => store.validityOfFields["Número da casa"] = true,
                        onSaved: (value) => store.payerToForm.payerAddress!.addressNumber = value,
                        validator: (value) => store.fieldValidator(context, "Número da casa", value, false),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                  child: Text(
                    "Assinatura",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: CustomDropDownContainerField(
                        labelText: "Produto",
                        width: MediaQuery.of(context).size.width * 0.95,
                        items: store.productsToDropdown,
                        icon: snapshot.connectionState == ConnectionState.waiting || store.isLoading 
                          ? const SizedBox(width: 15, height: 15, child: CircularProgressIndicator(strokeWidth: 2,))
                          : null,
                        onChanged: snapshot.connectionState == ConnectionState.waiting || store.isLoading 
                          ? null
                          : (value) {
                            value as SetProductMapper;
                            store.subscriptionToForm.subscriptionItems = [
                              SetSubscriptionItemMapper(
                                subscriptionItemId: value.productId
                              )
                            ];
                            valueController.text = value.productPrice.toString();
                          },
                        isWrong: !(store.validityOfFields["Área"] ?? true),
                        onTap: () => store.validityOfFields["Área"] = true,
                        onSaved: (value) => store.subscriptionToForm.subscriptionItems = [
                          SetSubscriptionItemMapper(
                            subscriptionItemId: (value as SetProductMapper).productId
                          )
                        ],
                        validator: (value) => store.fieldValidator(context, "Área", value, false),
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormContainerField(
                        labelText: "Frequência de pagamento",
                        isWrong: !(store.validityOfFields["Frequência de pagamento"] ?? true),
                        onTap: () => store.validityOfFields["Frequência de pagamento"] = true,
                        onChanged: (value) => store.validityOfFields["Frequência de pagamento"] = true,
                        onSaved: (value) => store.subscriptionToForm.subscriptionIntervalSize = num.tryParse(value??""),
                        validator: (value) => store.fieldValidator(context, "Frequência de pagamento", value, false),
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormContainerField(
                        labelText: "Valor",
                        readOnly: true,
                        controller: valueController,
                        isWrong: !(store.validityOfFields["Valor"] ?? true),
                        onTap: () => store.validityOfFields["Valor"] = true,
                        onChanged: (value) => store.validityOfFields["Valor"] = true,
                        validator: (value) => store.fieldValidator(context, "Valor", value, false),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomDatePickerField(
                        labelText: "Vencimento da primerira parcela",
                        controller: dueDateController,
                        lastDate: DateTime.now().add(const Duration(days: 3650)),
                        isWrong: !(store.validityOfFields["Vencimento da primerira parcela"] ?? true),
                        onTap: () => store.validityOfFields["Vencimento da primerira parcela"] = true,
                        onChanged: (value) => store.validityOfFields["Vencimento da primerira parcela"] = true,
                        onSaved: (value) => store.subscriptionToForm.subscriptionFirstDueDate = value,
                        validator: (value) => store.fieldValidator(context, "Vencimento da primerira parcela", value, false),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
    );
  }
}
