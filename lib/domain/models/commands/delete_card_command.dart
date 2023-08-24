class DeleteCardCommand {
  String? cardId;

  DeleteCardCommand({
    this.cardId,
  });

  Map<String, dynamic> MapToJson() => {
    'id': cardId,
  };
}