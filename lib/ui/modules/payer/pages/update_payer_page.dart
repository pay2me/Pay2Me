import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pay_2_me/domain/models/mapper/set_payer_mapper.dart';
import 'package:pay_2_me/ui/modules/payer/export_payer.dart';
import 'package:pay_2_me/ui/shared/widgets/fields/custom_datePicker_field.dart';
import 'package:pay_2_me/ui/shared/widgets/fields/custom_textFormField_container_field.dart';
import 'package:pay_2_me/ui/shared/widgets/scaffolds/custom_form_scaffold.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class UpdatePayerPage extends StatelessWidget {
  const UpdatePayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<UpdatePayerStore>(context, listen: false);

    store.payerToForm = ModalRoute.of(context)!.settings.arguments as SetPayerMapper;

    final maskPhone = MaskTextInputFormatter(mask: "+55 (##) #####-####", filter: {"#": RegExp(r'[0-9]')});
    final maskCPF = MaskTextInputFormatter(mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
    final maskCardNumber = MaskTextInputFormatter(mask: "#### #### #### ####", filter: {"#": RegExp(r'[0-9]')});
    final maskCEP = MaskTextInputFormatter(mask: "#####-###", filter: {"#": RegExp(r'[0-9]')});
    final maskCVV = MaskTextInputFormatter(mask: "###", filter: {"#": RegExp(r'[0-9]')});

    TextEditingController expiryDateController = TextEditingController();
    TextEditingController dueDateController = TextEditingController();
    TextEditingController planExpirationController = TextEditingController();

    return Observer(
      builder: (context) => CustomFormScaffold(
        formKey: store.formKey,
        title: const Text("Cadastro"),
        submitForm: () => store.submitUpdateForm(context),
        buttonChild: store.isLoading
          ? const CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
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
                    initialValue: store.payerToForm.payerName,
                    labelText: "Nome",
                    isWrong: !(store.validityOfFields["Nome"] ?? true),
                    onTap: () => store.validityOfFields["Nome"] = true,
                    onChanged: (value) => store.validityOfFields["Nome"] = true,
                    onSaved: (value) => store.payerToForm.payerName = value,
                    validator: (value) => store.fieldValidator(context, "Nome", value, false),
                  ),
                ),
                Expanded(
                  child: CustomTextFormContainerField(
                    initialValue: store.payerToForm.payerPhone,
                    labelText: "Telefone",
                    inputFormatters: [maskPhone],
                    isWrong: !(store.validityOfFields["Telefone"] ?? true),
                    onTap: () => store.validityOfFields["Telefone"] = true,
                    onChanged: (value) => store.validityOfFields["Telefone"] = true,
                    onSaved: (value) => store.payerToForm.payerPhone = value,
                    validator: (value) => store.fieldValidator(context, "Telefone", value, false),
                  ),
                ),
                Expanded(
                  child: CustomTextFormContainerField(
                    initialValue: store.payerToForm.payerCpf,
                    labelText: "CPF",
                    inputFormatters: [maskCPF],
                    isWrong: !(store.validityOfFields["CPF"] ?? true),
                    onTap: () => store.validityOfFields["CPF"] = true,
                    onChanged: (value) => store.validityOfFields["CPF"] = true,
                    onSaved: (value) => store.payerToForm.payerCpf = value,
                    validator: (value) => store.fieldValidator(context, "CPF", value, false),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormContainerField(
                    initialValue: store.payerToForm.payerAddress!.addressCity,
                    labelText: "Cidade",
                    isWrong: !(store.validityOfFields["Cidade"] ?? true),
                    onTap: () => store.validityOfFields["Cidade"] = true,
                    onChanged: (value) => store.validityOfFields["Cidade"] = true,
                    onSaved: (value) => store.payerToForm.payerAddress!.addressCity = value,
                    validator: (value) => store.fieldValidator(context, "Cidade", value, false),
                  ),
                ),
                Expanded(
                  child: CustomTextFormContainerField(
                    initialValue: store.payerToForm.payerAddress!.addressState,
                    labelText: "Estado",
                    isWrong: !(store.validityOfFields["Estado"] ?? true),
                    onTap: () => store.validityOfFields["Estado"] = true,
                    onChanged: (value) => store.validityOfFields["Estado"] = true,
                    onSaved: (value) => store.payerToForm.payerAddress!.addressState = value,
                    validator: (value) => store.fieldValidator(context, "Estado", value, false),
                  ),
                ),
                Expanded(
                  child: CustomTextFormContainerField(
                    initialValue: store.payerToForm.payerAddress!.addressNeighborhood,
                    labelText: "Bairro",
                    isWrong: !(store.validityOfFields["Bairro"] ?? true),
                    onTap: () => store.validityOfFields["Bairro"] = true,
                    onChanged: (value) => store.validityOfFields["Bairro"] = true,
                    onSaved: (value) => store.payerToForm.payerAddress!.addressNeighborhood = value,
                    validator: (value) => store.fieldValidator(context, "Bairro", value, false),
                  ),
                ),
                Expanded(
                  child: CustomTextFormContainerField(
                    initialValue: store.payerToForm.payerAddress!.addressCEP,
                    labelText: "CEP",
                    inputFormatters: [maskCEP],
                    isWrong: !(store.validityOfFields["CEP"] ?? true),
                    onTap: () => store.validityOfFields["CEP"] = true,
                    onChanged: (value) => store.validityOfFields["CEP"] = true,
                    onSaved: (value) => store.payerToForm.payerAddress!.addressCEP = value,
                    validator: (value) => store.fieldValidator(context, "CEP", value, false),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
              child: Text(
                "Cartão",
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
                    initialValue: store.payerToForm.payerCard!.cardNumber,
                    labelText: "Número do cartão",
                    inputFormatters: [maskCardNumber],
                    isWrong: !(store.validityOfFields["Número do cartão"] ?? true),
                    onTap: () => store.validityOfFields["Número do cartão"] = true,
                    onChanged: (value) => store.validityOfFields["Número do cartão"] = true,
                    onSaved: (value) => store.payerToForm.payerCard!.cardNumber = value,
                    validator: (value) => store.fieldValidator(context, "Número do cartão", value, false),
                  ),
                ),
                Expanded(
                  child: CustomTextFormContainerField(
                    initialValue: store.payerToForm.payerCard!.cardPrintedName,
                    labelText: "Nome no cartão",
                    isWrong: !(store.validityOfFields["Nome no cartão"] ?? true),
                    onTap: () => store.validityOfFields["Nome no cartão"] = true,
                    onChanged: (value) => store.validityOfFields["Nome no cartão"] = true,
                    onSaved: (value) => store.payerToForm.payerCard!.cardPrintedName = value,
                    validator: (value) => store.fieldValidator(context, "Nome no cartão", value, false),
                  ),
                ),
                Expanded(
                  child: CustomDatePickerField(
                    initialValue: store.payerToForm.payerCard!.cardExpiryDate,
                    labelText: "Data de vencimento",
                    controller: expiryDateController,
                    initialDatePickerMode: DatePickerMode.year,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 36500)),
                    isWrong: !(store.validityOfFields["Data de vencimento"] ?? true),
                    onTap: () => store.validityOfFields["Data de vencimento"] = true,
                    onChanged: (value) => store.validityOfFields["Data de vencimento"] = true,
                    onSaved: (value) => store.payerToForm.payerCard!.cardExpiryDate = value,
                    validator: (value) => store.fieldValidator(context, "Data de vencimento", value, false),
                  ),
                ),
                Expanded(
                  child: CustomTextFormContainerField(
                    initialValue: store.payerToForm.payerCard!.cardCvv,
                    labelText: "CVV",
                    inputFormatters: [maskCVV],
                    isWrong: !(store.validityOfFields["CVV"] ?? true),
                    onTap: () => store.validityOfFields["CVV"] = true,
                    onChanged: (value) => store.validityOfFields["CVV"] = true,
                    onSaved: (value) => store.payerToForm.payerCard!.cardCvv = value,
                    validator: (value) => store.fieldValidator(context, "CVV", value, false),
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
                  child: CustomTextFormContainerField(
                    initialValue: store.payerToForm.payerService!.serviceName,
                    labelText: "Serviço",
                    isWrong: !(store.validityOfFields["Serviço"] ?? true),
                    onTap: () => store.validityOfFields["Serviço"] = true,
                    onChanged: (value) => store.validityOfFields["Serviço"] = true,
                    onSaved: (value) => store.payerToForm.payerService!.serviceName = value,
                    validator: (value) => store.fieldValidator(context, "Serviço", value, false),
                  ),
                ),
                Expanded(
                  child: CustomTextFormContainerField(
                    initialValue: store.payerToForm.payerService!.serviceFrequency,
                    labelText: "Frequência de pagamento",
                    isWrong: !(store.validityOfFields["Frequência de pagamento"] ?? true),
                    onTap: () => store.validityOfFields["Frequência de pagamento"] = true,
                    onChanged: (value) => store.validityOfFields["Frequência de pagamento"] = true,
                    onSaved: (value) => store.payerToForm.payerService!.serviceFrequency = value,
                    validator: (value) => store.fieldValidator(context, "Frequência de pagamento", value, false),
                  ),
                ),
                Expanded(
                  child: CustomTextFormContainerField(
                    initialValue: store.payerToForm.payerService!.serviceValue,
                    labelText: "Valor",
                    isWrong: !(store.validityOfFields["Valor"] ?? true),
                    onTap: () => store.validityOfFields["Valor"] = true,
                    onChanged: (value) => store.validityOfFields["Valor"] = true,
                    onSaved: (value) => store.payerToForm.payerService!.serviceValue = value,
                    validator: (value) => store.fieldValidator(context, "Valor", value, false),
                  ),
                ),
                Expanded(
                  child: CustomDatePickerField(
                    initialValue: store.payerToForm.payerService!.serviceSubscriptionExpirationDate,
                    labelText: "Vencimento da parcela",
                    controller: dueDateController,
                    lastDate: DateTime.now().add(const Duration(days: 3650)),
                    isWrong: !(store.validityOfFields["Vencimento"] ?? true),
                    onTap: () => store.validityOfFields["Vencimento"] = true,
                    onChanged: (value) => store.validityOfFields["Vencimento"] = true,
                    onSaved: (value) => store.payerToForm.payerService!.serviceSubscriptionExpirationDate = value,
                    validator: (value) => store.fieldValidator(context, "Vencimento", value, false),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CustomDatePickerField(
                    initialValue: store.payerToForm.payerService!.serviceExpirationPlanDate,
                    labelText: "Vencimento do plano",
                    controller: planExpirationController,
                    lastDate: DateTime.now().add(const Duration(days: 3650)),
                    isWrong: !(store.validityOfFields["Vencimento do plano"] ?? true),
                    onTap: () => store.validityOfFields["Vencimento do plano"] = true,
                    onChanged: (value) => store.validityOfFields["Vencimento do plano"] = true,
                    onSaved: (value) => store.payerToForm.payerService!.serviceExpirationPlanDate = value,
                    validator: (value) => store.fieldValidator(context, "Vencimento do plano", value, false),
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
