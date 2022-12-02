class ColumnAttributes {
  final String columnName;
  final double columntWidthRate;
  final double columnLeftMarginRate;
  final String? Function(String?)? validator;
  final Type? type;
  final List<Enum>? enumValus;

  ColumnAttributes(
      {required this.columnName,
      required this.columntWidthRate,
      required this.columnLeftMarginRate,
      this.type,
      this.enumValus,
      this.validator});
}
