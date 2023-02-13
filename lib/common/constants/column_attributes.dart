class ColumnAttributes {
  final String? toJson;
  final String name;
  final double width;
  final double leftMargin;
  final String? Function(String?)? validator;
  final Type? type;
  final List<Enum>? enumValus;
  final bool? isCuDialog;
  final Type? cuDialogTargetModel;
  final Map<int, String>? cuDialogTextMapper;
  final Map<String, String>? cuDialogJsonMapper;
  final bool? isHyperLink;
  final Type? hyperLinkTargetModel;
  final String? cuDialogSearchTextTarget;
  final String? cuDialogSearchQueryTarget;

  ColumnAttributes({
    this.toJson,
    required this.name,
    required this.width,
    required this.leftMargin,
    this.type,
    this.enumValus,
    this.validator,
    this.isCuDialog,
    this.cuDialogTargetModel,
    this.cuDialogTextMapper,
    this.cuDialogJsonMapper,
    this.isHyperLink,
    this.hyperLinkTargetModel,
    this.cuDialogSearchTextTarget,
    this.cuDialogSearchQueryTarget,
  });
}
