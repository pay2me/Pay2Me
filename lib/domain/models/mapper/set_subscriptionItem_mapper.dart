class SetSubscriptionItemMapper {
  String? subscriptionItemId;
  String? subscriptionItemDescription;
  String? subscriptionItemGeneratedInstallments;
  String? subscriptionItemNumberInstallments;
  String? subscriptionItemPrice;
  String? subscriptionItemProductsServicesId;
  String? subscriptionItemQuantity;
  String? subscriptionItemType;

  SetSubscriptionItemMapper({
    this.subscriptionItemId,
    this.subscriptionItemDescription,
    this.subscriptionItemGeneratedInstallments,
    this.subscriptionItemNumberInstallments,
    this.subscriptionItemPrice,
    this.subscriptionItemProductsServicesId,
    this.subscriptionItemQuantity,
    this.subscriptionItemType,
  });

  SetSubscriptionItemMapper.MapFromJson(Map<String, dynamic> json) {
    subscriptionItemId = json['id'];
    subscriptionItemDescription = json['description'];
    subscriptionItemGeneratedInstallments = json['generated_installments'];
    subscriptionItemNumberInstallments = json['number_installments'];
    subscriptionItemPrice = json['price'];
    subscriptionItemProductsServicesId = json['products_services_id'];
    subscriptionItemQuantity = json['quantity'];
    subscriptionItemType = json['type'];
  }

  Map<String, dynamic> jsonFromMap() => {
    "id": subscriptionItemId,
    "description": subscriptionItemDescription,
    "generated_installments": subscriptionItemGeneratedInstallments,
    "number_installments": subscriptionItemNumberInstallments,
    "price": subscriptionItemPrice,
    "products_services_id": subscriptionItemProductsServicesId,
    "quantity": subscriptionItemQuantity,
    "type": subscriptionItemType,
  };
}