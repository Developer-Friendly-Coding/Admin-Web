// import 'package:clean_arch/common/constants/text_style.dart';
// import 'package:clean_arch/provider/impl/table_provider_impl.dart';
// import 'package:clean_arch/provider/signin_provider.dart';
// import 'package:clean_arch/repo/impl/signin_repo_impl.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart' show timeDilation;
// import 'package:flutter_login/flutter_login.dart';
// import 'package:clean_arch/common/constants/secure_storage.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// class OverLayEntryProvider extends ChangeNotifier {
//   late OverlayEntry _overlayEntry;
//   bool _infoOverlayIsShown = false;
//
//   void insertOverlayEntry(BuildContext context) {
//     Overlay.of(context)!.insert(_overlayEntry);
//   }
//
//   void _showInfoOverlay(BuildContext context, TableProvider providerRead) {
//     if (_infoOverlayIsShown) return;
//     _overlayEntry = _createInfoOverlayEntry(providerRead);
//     Overlay.of(context)!.insert(_overlayEntry);
//     _infoOverlayIsShown = true;
//   }
//
//   void _hideOverlay(TableProvider providerRead) {
//     _infoOverlayIsShown = false;
//     _overlayEntry.remove();
//     providerRead.initDataForCuAndUpdateTextList(providerRead.selectedId);
//   }
//
//   OverlayEntry _createInfoOverlayEntry(
//       TableProvider providerRead, LayerLink _layerLink) {
//     return OverlayEntry(builder: (context) {
//       return Positioned(
//         width: 100,
//         height: 200,
//         child: CompositedTransformFollower(
//           offset: Offset(-60, 30),
//           link: _layerLink,
//           child: Container(
//             child: Column(
//               children: <Widget>[
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       fixedSize: Size(89, 64),
//                       backgroundColor: Color(0xffFFFFFF)),
//                   child: Text(
//                     '수정하기',
//                     style: detailInfoMoreTextStyle,
//                   ),
//                   onPressed: () {
//                     createFieldList = setField(context, providerRead);
//                     setState(() {
//                       isEditMode = !isEditMode;
//                     });
//
//                     _hideOverlay(providerRead);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
