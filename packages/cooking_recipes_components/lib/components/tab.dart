import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

/// A custom tab selector widget designed for use in Flutter applications.
///
/// This widget provides a tab selector that allows users to switch between
/// different tabs or categories in your application.
///
/// Example usage:
///
/// ```dart
/// CRTab(
///   onChanged: (selectedIndex) {
///     // Handle tab change here
///   },
/// )
/// ```
///
/// The [CRTab] widget displays a tab selector that can switch between different
/// tabs or categories. The currently selected tab index is controlled by the
/// [onChanged] callback, which is called when the user selects a different tab.
///
/// This widget is useful for implementing tab-based navigation or filtering
/// in your application.
class CRTab extends StatefulWidget {
  /// A callback function that is called when the selected tab index changes.
  final ValueChanged<int>? onChanged;

  /// Creates a [CRTab] widget.
  ///
  /// The [onChanged] parameter is required and is called when the selected
  /// tab index changes. It provides the index of the newly selected tab.
  const CRTab({
    required this.onChanged,
    super.key,
  });

  @override
  State<CRTab> createState() => _CRTabState();
}

class _CRTabState extends State<CRTab> {
  late int _activeTabIndex;

  void _handleSelected(int value) {
    setState(() => _activeTabIndex = value);

    widget.onChanged != null ? _handleChanged(value) : null;
  }

  _handleChanged(int? value) => widget.onChanged!(_activeTabIndex);

  @override
  void initState() {
    super.initState();
    _activeTabIndex = 0;
  }

  @override
  Widget build(BuildContext context) => FlutterToggleTab(
        width: CRSizes.large * 2,
        borderRadius: CRSizes.small,
        height: CRSizes.tera,
        isShadowEnable: false,
        marginSelected: const EdgeInsets.all(CRSizes.quarck),
        selectedTextStyle: const TextStyle(
          color: CRColors.white,
          fontSize: CRSizes.micro,
          fontWeight: FontWeight.normal,
        ),
        unSelectedTextStyle: TextStyle(
          color: Theme.of(context).highlightColor,
          fontSize: CRSizes.micro,
          fontWeight: FontWeight.normal,
        ),
        unSelectedBackgroundColors: <Color>[
          Theme.of(context).disabledColor,
          Theme.of(context).disabledColor,
        ],
        labels: const <String>['Ingredients', 'Instructions'],
        selectedIndex: _activeTabIndex,
        selectedLabelIndex: _handleSelected,
      );
}
