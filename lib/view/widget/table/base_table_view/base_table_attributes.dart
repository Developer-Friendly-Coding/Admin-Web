class ColumnAttributes {
  final String name;
  final double widthRate;
  final double leftMarginRate;
  final String? Function(String?)? validator;
  final Type? type;
  final List<Enum>? enumValus;
  final bool? isCuDialog;
  final bool? isHyperLink;
  final Type? hyperLinkTargetModel;

  ColumnAttributes({
    required this.name,
    required this.widthRate,
    required this.leftMarginRate,
    this.type,
    this.enumValus,
    this.validator,
    this.isCuDialog,
    this.isHyperLink,
    this.hyperLinkTargetModel,
  });
}
