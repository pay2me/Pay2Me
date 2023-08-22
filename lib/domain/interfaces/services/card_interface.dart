import 'package:pay_2_me/domain/models/export_models.dart';

abstract class ICardService {
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
  });

  Future<GetCardQuery> create(CreateCardCommand command, String token);
  Future<GetCardQuery> delete(DeleteCardCommand command, String token);
}
