import 'package:dio/dio.dart';

import 'package:pay_2_me/domain/models/export_models.dart';
import 'package:pay_2_me/domain/interfaces/export_interfaces.dart';
import 'package:pay_2_me/infra/configs/export_configs.dart';

class SubscriptionService implements ISubscriptionService {
  @override
  Future<GetSubscriptionQuery> search(String token) async {
    var url = "${Settings.cobreFacilEndPoint}/subscriptions";
    var response = await Dio().get(url,
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ));
    return GetSubscriptionQuery.MapFromResponse(response);
  }

  @override
  Future<bool?> create(CreateSubscriptionCommand command, String token) async {
    var url = "${Settings.cobreFacilEndPoint}/subscriptions";
    var response = await Dio().post(url,
        data: command.MapToJson(),
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ));
    var result = response.data;
    return result != null;
  }

  @override
  Future<bool?> update(UpdateSubscriptionCommand command, String token) async {
    var url =
        "${Settings.cobreFacilEndPoint}/subscriptions/${command.subscriptionId}/update";
    var response = await Dio().put(url,
        data: command.MapToJson(),
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ));
    var result = response.data;
    return result != null;
  }

  @override
  Future<bool?> delete(DeleteSubscriptionCommand command, String token) async {
    var url =
        "${Settings.cobreFacilEndPoint}/subscriptions/${command.subscriptionId}/delete";
    var response = await Dio().delete(url,
        data: command.MapToJson(),
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ));
    var result = response.data;
    return result == null;
  }

  @override
  Future<bool?> cancel(CancelSubscriptionCommand command, String token) async {
    var url =
        "${Settings.cobreFacilEndPoint}/subscriptions/${command.subscriptionId}/cancel";
    var response = await Dio().post(url,
        data: command.MapToJson(),
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ));
    var result = response.data;
    return result == null;
  }

  @override
  Future<bool?> disableRecurrence(
      DisableRecurrenceSubscriptionCommand command, String token) async {
    var url =
        "${Settings.cobreFacilEndPoint}/subscriptions/${command.subscriptionId}/pause";
    var response = await Dio().post(url,
        data: command.MapToJson(),
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ));
    var result = response.data;
    return result == null;
  }

  @override
  Future<bool?> enableRecurrence(
      EnableRecurrenceSubscriptionCommand command, String token) async {
    var url =
        "${Settings.cobreFacilEndPoint}/subscriptions/${command.subscriptionId}/reactivate";
    var response = await Dio().post(url,
        data: command.MapToJson(),
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ));
    var result = response.data;
    return result == null;
  }

  @override
  Future<bool?> finish(FinishSubscriptionCommand command, String token) {
    // TODO: implement finish
    throw UnimplementedError();
  }

  @override
  Future<bool?> pause(PauseSubscriptionCommand command, String token) {
    // TODO: implement pause
    throw UnimplementedError();
  }

  @override
  Future<bool?> reactivate(
      ReactivateSubscriptionCommand command, String token) {
    // TODO: implement reactivate
    throw UnimplementedError();
  }

  @override
  Future<bool?> renewed(RenewedSubscriptionCommand command, String token) {
    // TODO: implement renewed
    throw UnimplementedError();
  }
}
