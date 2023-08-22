import 'package:dio/dio.dart';

import 'package:pay_2_me/domain/models/commands/create_card_command.dart';

import 'package:pay_2_me/domain/models/commands/delete_card_command.dart';

import 'package:pay_2_me/domain/models/querys/get_card_query.dart';

import '../../domain/interfaces/services/card_interface.dart';
import '../configs/settings.dart';

class CardService implements ICardService {
  @override
  Future<bool?> create(CreateCardCommand command, String token) async {
    var url = "${Settings.cobreFacilEndPoint}/cards";
    var response = await Dio().post(
      url,
      data: command.MapToJson(),
      options: Options(headers: {"authorization": "Bearer $token"}),
    );
    var result = response.data;
    return result != null;
  }

  @override
  Future<bool?> delete(DeleteCardCommand command, String token) async {
    var url = "${Settings.cobreFacilEndPoint}/cards/${command.cardId}";
    var response = await Dio().delete(
      url,
      data: command.MapToJson(),
      options: Options(headers: {"authorization": "Bearer $token"}),
    );
    var result = response.data;
    return result != null;
  }

  @override
  Future<GetCardQuery> search(
    String token, {
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
    var url = "${Settings.cobreFacilEndPoint}/cards/customer_id=$payerId";
    var response = await Dio().delete(
      url,
      options: Options(headers: {"authorization": "Bearer $token"}),
    );
    var result = response.data;
    return GetCardQuery.MapFromResponse(result);
  }
}
