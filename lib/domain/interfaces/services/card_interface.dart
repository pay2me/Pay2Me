import 'package:pay_2_me/domain/models/export_models.dart';

abstract class ICardService {
  Future<GetCardQuery> search(
    String token, 
    {
      String? payerId, 
      String? brand, 
      String? expiration, 
      String? expirationStart,
      String? expirationEnd,
      String? sortBy,
      String? orderBy,
      int? limit,
      int? offset,
    }
  );

  Future<int?> create(CreateCardCommand command, String token);
  Future<int?> delete(DeleteCardCommand command, String token);
}