import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/ui/business/card_business.dart';
import 'package:pay_2_me/ui/modules/index/stores/main_index.store.dart';

part 'services_card.store.g.dart';

class ServicesCardStore = _ServicesCardStore with _$ServicesCardStore;

abstract class _ServicesCardStore with Store, ChangeNotifier {
  //  Business

  final cardBusiness = CardBusiness();

  // GETS

  Future<List<SetCardMapper>> searchCards(
    BuildContext context, {
    String? payerId,
    String? brand,
    String? expiration,
    String? expirationStart,
    String? expirationEnd,
    String? sortBy,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    String token = Provider.of<MainIndexStore>(context, listen: false)
            .storegeAuthData
            .authToken ??
        "";

    return (await cardBusiness.search(
          token,
          payerId: payerId,
          brand: brand,
          expiration: expiration,
          expirationStart: expirationStart,
          expirationEnd: expirationEnd,
          sortBy: sortBy,
          orderBy: orderBy,
          limit: limit,
          offset: offset,
        )) ??
        [];
  }

  // CRUD

  Future<String?> createCard(BuildContext context, SetCardMapper card) async {
    String token = Provider.of<MainIndexStore>(context, listen: false)
            .storegeAuthData
            .authToken ??
        "";

    CreateCardCommand createCardCommand = CreateCardCommand(
      cardPayerId: card.cardPayerId,
      cardIsDefault: card.cardIsDefault,
      cardCardHolder: card.cardCardHolder,
      cardNumber: card.cardNumber,
      cardExpirationYear: card.cardExpirationYear,
      cardExpirationMonth: card.cardExpirationMonth,
      cardSecurityCode: card.cardSecurityCode,
    );

    return (await cardBusiness.create(createCardCommand, token));
  }

  Future<String?> deleteCard(BuildContext context, SetCardMapper card) async {
    String token = Provider.of<MainIndexStore>(context, listen: false)
            .storegeAuthData
            .authToken ??
        "";

    DeleteCardCommand deleteCardCommand = DeleteCardCommand(
      cardId: card.cardId,
    );

    return (await cardBusiness.delete(deleteCardCommand, token));
  }
}
