import 'package:bookstore/src/constant/colors.dart';
import 'package:bookstore/src/presentation/shared/animation_helper.dart';
import 'package:bookstore/src/presentation/shared/spacing.dart';
import 'package:bookstore/src/util/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:intl/intl.dart';

class AppBarHelper extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHelper({
    Key? key,
    required this.scaffoldKey,
    required this.onLanguageChanged,
    this.height = 60.0,
    this.shape,
    this.title,
    this.leading,
    this.backgroundColor = CustomColor.neutral,
    this.isInSafeArea = true,
    this.widget,
    this.actions,
    this.isLeadingMenu = false,
    this.forcedBackButton,
    this.useShadow = true,
    this.titleWidget,
  }) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey;
  final double height;
  final ShapeBorder? shape;
  final String? title;
  final Widget? leading;
  final Color backgroundColor;
  final bool isInSafeArea;
  final Widget? widget;
  final List<Widget>? actions;
  final bool isLeadingMenu;
  final bool? forcedBackButton;
  final bool useShadow;
  final Widget? titleWidget;

  /// Call [setState] after language has changed inside [onLanguageChanged] to reflect updated language on screen.
  final VoidCallback onLanguageChanged;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: Container(
        decoration: BoxDecoration(
          color: CustomColor.neutral,
          boxShadow: useShadow
              ? <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(.08),
                    blurRadius: 8.0,
                  ),
                ]
              : null,
        ),
        child: AppBar(
          shape: shape,
          automaticallyImplyLeading: false,
          backgroundColor: backgroundColor,
          elevation: 0.0,
          flexibleSpace: isInSafeArea ? _buildAppBarContent(context) : widget,
        ),
      ),
    );
  }

  Widget _buildAppBarContent(BuildContext context) {
    final bool cannotPop = (forcedBackButton == null ||
            (forcedBackButton != null && !forcedBackButton!)) &&
        !isLeadingMenu &&
        ModalRoute.of(context)!.isFirst;

    return SafeArea(
      child: widget ??
          Center(
            child: SizedBox(
              height: height,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 4.0,
                ),
                child: Row(
                  children: <Widget>[
                    const Spacing.horizontal(4.0),
                    _buildLeadingMenu(),
                    _buildLeadingBackButton(context),
                    if (leading != null)
                      leading!
                    else if (cannotPop)
                      const Spacing.horizontal(16.0),
                    if (titleWidget != null)
                      titleWidget!
                    else if (title != null && title!.trim() != '')
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 2.0,
                          ),
                          child: _buildTitle(),
                        ),
                      ),
                    if (actions != null && actions!.isNotEmpty) ...actions!,
                    // _buildLocaleButton(context),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  // Widget _buildLocaleButton(BuildContext context) {
  //   return PopupMenuButton<Locale>(
  //     onSelected: (Locale selected) => S.load(selected).then(
  //           (_) => onLanguageChanged(),
  //         ),
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(
  //         vertical: 16.0,
  //         horizontal: 12.0,
  //       ),
  //       child: Text(Intl.getCurrentLocale() == 'id' ? '🇮🇩' : '🇺🇸'),
  //     ),
  //     itemBuilder: (BuildContext context) {
  //       return S.delegate.supportedLocales
  //           .map(
  //             (Locale item) => PopupMenuItem<Locale>(
  //               value: item,
  //               child: Text(
  //                 item.toString(),
  //                 style: CustomTextStyles.textXs.regular.copyWith(
  //                   color: Colors.black,
  //                 ),
  //               ),
  //             ),
  //           )
  //           .toList();
  //     },
  //   );
  // }

  Widget _buildLeadingMenu() {
    return AnimatedOpacitySize(
      isVisible: (forcedBackButton == null ||
              (forcedBackButton != null && !forcedBackButton!)) &&
          isLeadingMenu &&
          leading == null,
      direction: Axis.horizontal,
      child: IconButton(
        onPressed: () {
          scaffoldKey.currentState?.openDrawer();
        },
        icon: const Material(
          color: Colors.transparent,
          child: Icon(
            Icons.menu,
            size: 24.0,
            color: Colors.black,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 12.0,
        ),
        visualDensity: const VisualDensity(
          horizontal: -4.0,
          vertical: -4.0,
        ),
        constraints: const BoxConstraints(
          minHeight: .0,
          minWidth: .0,
        ),
        iconSize: 24.0,
        color: Colors.black,
      ),
    );
  }

  Widget _buildLeadingBackButton(BuildContext context) {
    final bool showBackButton =
        !isLeadingMenu && leading == null && !ModalRoute.of(context)!.isFirst;
    return AnimatedOpacitySize(
      isVisible:
          (forcedBackButton != null && forcedBackButton!) || showBackButton,
      direction: Axis.horizontal,
      child: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Material(
          color: Colors.transparent,
          child: Icon(
            Icons.arrow_left,
            size: 24.0,
            color: Colors.black,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 12.0,
        ),
        visualDensity: const VisualDensity(
          horizontal: -4.0,
          vertical: -4.0,
        ),
        constraints: const BoxConstraints(
          minHeight: .0,
          minWidth: .0,
        ),
        iconSize: 24.0,
        color: Colors.black,
      ),
    );
  }

  Widget _buildTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: FittedBox(
        child: Material(
          color: Colors.transparent,
          child: Text(
            title!,
            style: CustomTextStyles.textXs.medium.copyWith(
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
