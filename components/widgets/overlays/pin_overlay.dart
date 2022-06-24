import 'dart:ui';

import 'package:bank9780/components/widgets/navigator_widget.dart';
import 'package:bank9780/components/widgets/pin_board_widget.dart';
import 'package:bank9780/modules/general/enum.dart';
import 'package:flutter/material.dart';

Future<void> showPinOverlay(
  BuildContext context, {
    required Process process,
    required Pages pages,
  }
) async {
  showGeneralDialog(
    barrierLabel       : 'PIN',
    barrierDismissible : true,
    barrierColor       : Colors.white.withOpacity(0.2),
    transitionDuration : const Duration(milliseconds: 150),
    context            : context,
    pageBuilder        : (_, __, ___) {
      return GestureDetector(
        onTap       : () => {},// routes.hide(context),
        onLongPress : () => {},
        child:
        SafeArea(
          child:
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child:
            BackdropFilter(
              filter : ImageFilter.blur(sigmaX: 40, sigmaY: 40),
              child  :
              Stack(
                children: [
                  Center(
                    child:
                    Material(
                      color: Colors.transparent,
                      child:
                      PinBoardWidget(
                        process : process,
                        pages   : pages,
                      )
                    )
                  ),
                  const Material(
                    color: Colors.transparent,
                    child:
                    NavigatorWidget(
                      logo : false,
                      bell : false,
                      menu : false,
                    )
                  ),
                ],
              ),
            )
          )
        )
      );
    },
  );
}
