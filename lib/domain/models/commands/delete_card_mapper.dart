class DeleteCardCommand {
  String? cardId;

  DeleteCardCommand({
    this.cardId,
  });

  Map<String, dynamic> MapToJson() => {
    'cardId': cardId,
  };
}