import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:provider/provider.dart';
import 'package:pay_2_me/ui/modules/payer/export_payer.dart';

part 'detail_payer.store.g.dart';

class DetailPayerStore = _DetailPayerStore with _$DetailPayerStore;

abstract class _DetailPayerStore with Store, ChangeNotifier {
  @observable
  bool isLoading = false;

  @observable
  List<String> permissions = [];

  @observable
  SetPayerMapper payerToDetail = SetPayerMapper();

  @observable
  bool changeEnable = false;

  @action
  Future<void> loadDataPayer(BuildContext context, SetPayerMapper payer) async {
    isLoading = true;

    payerToDetail = payer;
    
    isLoading = false;
  }

  @action
  Future<void> confirmAndDeletePayer(BuildContext context, SetPayerMapper payer) async {
    bool isDelete = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Você tem certeza?'),
        content: Text('Você irá deletar permanentemente o usuário com o nome:\n${payer.payerName}'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Não'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Sim'),
          ),
        ],
      ),
    )??false;

    if(isDelete) {
      isLoading = true;

      bool deleteComplete = await Provider.of<ServicesPayerStore>(context, listen: false).deletePayer(context, payer);
      showMessage(context, deleteComplete);
      
      if(deleteComplete) {
        await Provider.of<MainPayerStore>(context, listen:false).loadPayers(context);
        Navigator.of(context).pop();
      }
      
      isLoading = false;
    }
  }

   void showMessage(BuildContext context, bool isSuccess) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          isSuccess 
            ? "Pagador deletado com sucesso!"
            : "Pagador não foi deletado!",
        ),
      ),
    );
  }
}
