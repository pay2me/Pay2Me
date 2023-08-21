import 'package:pay_2_me/domain/models/mapper/set_subscriptionItem_mapper.dart';

class SetSubscriptionMapper {
  String? subscriptionId;
  String? subscriptionAttachment;
  String? subscriptionContractNumber;
  DateTime? subscriptionCreateInvoice;
  String? subscriptionPayerId;
  num? subscriptionDueDay;
  DateTime? subscriptionExpiresAt;
  DateTime? subscriptionFirstDueDate;
  num? subscriptionGenerateDays;
  num? subscriptionIntervalSize;
  String? subscriptionIntervalType;
  List<SetSubscriptionItemMapper>? subscriptionItems;
  DateTime? subscriptionNextExpiration;
  String? subscriptionNotificationRuleId;
  DateTime? subscriptionPausedAt;
  String? subscriptionPayableWith;
  String? subscriptionPlansId;
  num? subscriptionQuantityGenerated;
  DateTime? subscriptionReactivateAt;
  String? subscriptionReference;
  String? subscriptionSequencialNumber;
  String? subscriptionSettings;
  String? subscriptionStatus;
  DateTime? subscriptionCreatedAt;
  DateTime? subscriptionUpdatedAt;

  SetSubscriptionMapper({
    this.subscriptionId,
    this.subscriptionAttachment,
    this.subscriptionContractNumber,
    this.subscriptionCreateInvoice,
    this.subscriptionPayerId,
    this.subscriptionDueDay,
    this.subscriptionExpiresAt,
    this.subscriptionFirstDueDate,
    this.subscriptionGenerateDays,
    this.subscriptionIntervalSize,
    this.subscriptionIntervalType,
    this.subscriptionItems,
    this.subscriptionNextExpiration,
    this.subscriptionNotificationRuleId,
    this.subscriptionPausedAt,
    this.subscriptionPayableWith,
    this.subscriptionPlansId,
    this.subscriptionQuantityGenerated,
    this.subscriptionReactivateAt,
    this.subscriptionReference,
    this.subscriptionSequencialNumber,
    this.subscriptionSettings,
    this.subscriptionStatus,
    this.subscriptionCreatedAt,
    this.subscriptionUpdatedAt,
  });

  SetSubscriptionMapper.MapFromJson(Map<String, dynamic> json) {
    subscriptionId = json['id'];
    subscriptionAttachment = json['attachment'];
    subscriptionContractNumber = json['contractnumber'];
    subscriptionCreateInvoice = json['createinvoice'];
    subscriptionPayerId = json['payerid'];
    subscriptionDueDay = json['dueday'];
    subscriptionExpiresAt = json['expiresat'];
    subscriptionFirstDueDate = json['firstduedate'];
    subscriptionGenerateDays = json['generatedays'];
    subscriptionIntervalSize = json['intervalsize'];
    subscriptionIntervalType = json['intervaltype'];
    subscriptionItems = (json['items'] as List).map((item) => SetSubscriptionItemMapper.MapFromJson(item)).toList();
    subscriptionNextExpiration = json['nextexpiration'];
    subscriptionNotificationRuleId = json['notificationruleid'];
    subscriptionPausedAt = json['pausedat'];
    subscriptionPayableWith = json['payablewith'];
    subscriptionPlansId = json['plansid'];
    subscriptionQuantityGenerated = json['quantitygenerated'];
    subscriptionReactivateAt = json['reactivateat'];
    subscriptionReference = json['reference'];
    subscriptionSequencialNumber = json['sequencialnumber'];
    subscriptionSettings = json['settings'];
    subscriptionStatus = json['status'];
    subscriptionCreatedAt = json['createdat'];
    subscriptionUpdatedAt = json['updatedat'];
  }
}

class SubscriptionSettings {
  SubscriptionSettingsDiscount? subscriptionSettingsDiscount;
  SubscriptionSettingsDiscountSubscription? subscriptionSettingsDiscountSubscription;
  SubscriptionSettingsInterest? subscriptionSettingsInterest;
  SubscriptionSettingsLateFee? subscriptionSettingsLateFee;
  num? sendTaxInvoice;
  SubscriptionSettingsWarning? subscriptionSettingsWarning;

  SubscriptionSettings({
    this.subscriptionSettingsDiscount,
    this.subscriptionSettingsDiscountSubscription,
    this.subscriptionSettingsInterest,
    this.subscriptionSettingsLateFee,
    this.sendTaxInvoice,
    this.subscriptionSettingsWarning,
  });

  SubscriptionSettings.MapFromJson(Map<String, dynamic> json) {
    subscriptionSettingsDiscount = SubscriptionSettingsDiscount.MapFromJson(json['discount']);
    subscriptionSettingsDiscountSubscription = SubscriptionSettingsDiscountSubscription.MapFromJson(json['discount_subscription']);
    subscriptionSettingsInterest = SubscriptionSettingsInterest.MapFromJson(json['interest']);
    subscriptionSettingsLateFee = SubscriptionSettingsLateFee.MapFromJson(json['lateFee']);
    sendTaxInvoice = json['send_tax_invoice'];
    subscriptionSettingsWarning = SubscriptionSettingsWarning.MapFromJson(json['warning']);
  }
}

class SubscriptionSettingsDiscount {
  String? subscriptionSettingsDiscountAmount;
  num? subscriptionSettingsDiscountLimitDate;
  String? subscriptionSettingsDiscountMode;

  SubscriptionSettingsDiscount({
    this.subscriptionSettingsDiscountAmount,
    this.subscriptionSettingsDiscountLimitDate,
    this.subscriptionSettingsDiscountMode,
  });

  SubscriptionSettingsDiscount.MapFromJson(Map<String, dynamic> json) {
    subscriptionSettingsDiscountAmount = json['amount'];
    subscriptionSettingsDiscountLimitDate = json['limit_date'];
    subscriptionSettingsDiscountMode = json['mode'];
  }
}

class SubscriptionSettingsDiscountSubscription {
  String? subscriptionSettingsDiscountSubscriptionAmount;
  num? subscriptionSettingsDiscountSubscriptionNumberInstallments;
  String? subscriptionSettingsDiscountSubscriptionMode;

  SubscriptionSettingsDiscountSubscription({
    this.subscriptionSettingsDiscountSubscriptionAmount,
    this.subscriptionSettingsDiscountSubscriptionNumberInstallments,
    this.subscriptionSettingsDiscountSubscriptionMode,
  });

  SubscriptionSettingsDiscountSubscription.MapFromJson(Map<String, dynamic> json) {
    subscriptionSettingsDiscountSubscriptionAmount = json['amount'];
    subscriptionSettingsDiscountSubscriptionNumberInstallments = json['number_installments'];
    subscriptionSettingsDiscountSubscriptionMode = json['mode'];
  }
}

class SubscriptionSettingsInterest {
  String? subscriptionSettingsInterestAmount;
  String? subscriptionSettingsInterestMode;

  SubscriptionSettingsInterest({
    this.subscriptionSettingsInterestAmount,
    this.subscriptionSettingsInterestMode,
  });

  SubscriptionSettingsInterest.MapFromJson(Map<String, dynamic> json) {
    subscriptionSettingsInterestAmount = json['amount'];
    subscriptionSettingsInterestMode = json['mode'];
  }
}

class SubscriptionSettingsLateFee {
  String? subscriptionSettingsInterestAmount;
  String? subscriptionSettingsInterestMode;

  SubscriptionSettingsLateFee({
    this.subscriptionSettingsInterestAmount,
    this.subscriptionSettingsInterestMode,
  });

  SubscriptionSettingsLateFee.MapFromJson(Map<String, dynamic> json) {
    subscriptionSettingsInterestAmount = json['amount'];
    subscriptionSettingsInterestMode = json['mode'];
  }
}

class SubscriptionSettingsWarning {
  String? subscriptionSettingsWarningDescription;

  SubscriptionSettingsWarning({
    this.subscriptionSettingsWarningDescription,
  });

  SubscriptionSettingsWarning.MapFromJson(Map<String, dynamic> json) {
    subscriptionSettingsWarningDescription = json['description'];
  }
}