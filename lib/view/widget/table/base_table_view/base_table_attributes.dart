///  테이블뷰의 칼럼 속성들(name,width,margin)을 설정할 수있는 클래스입니다.
///```dart
///TableAttributes(columnName,columntWidthRate,columnLeftMarginRate)
///```

class ColumnAttributes {
  final String columnName;
  final double columntWidthRate;
  final double columnLeftMarginRate;
  final String? Function(String?)? validator;

  ColumnAttributes(
      {required this.columnName,
      required this.columntWidthRate,
      required this.columnLeftMarginRate,
      this.validator});
}
