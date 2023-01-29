enum DiscountType {
  amount,
  percentage,
}

extension DiscountTypeExt on DiscountType {
  static final Map<DiscountType, String> _texts = <DiscountType, String>{
    DiscountType.amount: 'amount',
    DiscountType.percentage: 'percentage',
  };

  String get text => _texts[this]!;

  bool get isAmount => this == DiscountType.amount;

  bool get isPercentage => this == DiscountType.percentage;
}

extension DiscountStringExt on String {
  DiscountType toDiscountType() => this == DiscountType.amount.text
      ? DiscountType.amount
      : DiscountType.percentage;
}
