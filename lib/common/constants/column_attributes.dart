class ColumnAttributes {
  final String? toJson;
  final String name;
  final double widthRate;
  final double leftMarginRate;
  final String? Function(String?)? validator;
  final Type? type;
  final List<Enum>? enumValus;
  final bool? isCuDialog;
  final Type? cuDialogTargetModel;
  final Map<int, String>? cuDialogTextMapper;
  final Map<String, String>? cuDialogJsonMapper;
  final bool? isHyperLink;
  final Type? hyperLinkTargetModel;

  ColumnAttributes({
    this.toJson,
    required this.name,
    required this.widthRate,
    required this.leftMarginRate,
    this.type,
    this.enumValus,
    this.validator,
    this.isCuDialog,
    this.cuDialogTargetModel,
    this.cuDialogTextMapper,
    this.cuDialogJsonMapper,
    this.isHyperLink,
    this.hyperLinkTargetModel,
  });
}
