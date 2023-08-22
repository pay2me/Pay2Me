import 'package:dio/dio.dart';

import 'package:pay_2_me/domain/models/commands/create_card_command.dart';

import 'package:pay_2_me/domain/models/commands/delete_card_command.dart';

import 'package:pay_2_me/domain/models/querys/get_card_query.dart';

import '../../domain/interfaces/services/card_interface.dart';
import '../configs/settings.dart';

class CardService implements ICardService {
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
    final List<String> queryParams = [];
    if (payerId != null) {
      queryParams.add("taxpayer_id=$payerId");
    }
    if (brand != null) {
      queryParams.add("ein=$brand");
    }
    if (expiration != null) {
      queryParams.add("email=$expiration");
    }
    if (expirationStart != null) {
      queryParams.add("personal_name=$expirationStart");
    }
    if (expirationEnd != null) {
      queryParams.add("company_name=$expirationEnd");
    }
    if (sortBy != null) {
      queryParams.add("sort_by=$sortBy");
    }
    if (orderBy != null) {
      queryParams.add("order_by=$orderBy");
    }
    if (limit != null) {
      queryParams.add("limit=$limit");
    }
    if (offset != null) {
      queryParams.add("offset=$offset");
    }

    final String queryString = queryParams.join('&');
    var url = "${Settings.cobreFacilEndPoint}/cards?$queryString";
    var response = await Dio().delete(
      url,
      options: Options(headers: {"authorization": "Bearer $token"}),
    );
    return GetCardQuery.MapFromResponse(response);
  }

  @override
  Future<GetCardQuery> create(CreateCardCommand command, String token) async {
    var url = "${Settings.cobreFacilEndPoint}/cards";
    var response = await Dio().post(
      url,
      data: command.MapToJson(),
      options: Options(headers: {"authorization": "Bearer $token"}),
    );
    return GetCardQuery.MapFromResponse(response);
  }

  @override
  Future<GetCardQuery> delete(DeleteCardCommand command, String token) async {
    var url = "${Settings.cobreFacilEndPoint}/cards/${command.cardId}";
    var response = await Dio().delete(
      url,
      data: command.MapToJson(),
      options: Options(headers: {"authorization": "Bearer $token"}),
    );
    return GetCardQuery.MapFromResponse(response);
  }

}
