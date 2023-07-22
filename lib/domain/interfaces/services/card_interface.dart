import 'package:pay_2_me/domain/models/export_models.dart';

abstract class ICardService {
  Future<GetCardQuery> getAll(String token);
  Future<int?> insert(CreateCardCommand command, String token);
  Future<int?> update(UpdateCardCommand command, String token);
  Future<int?> delete(DeleteCardCommand command, String token);
}