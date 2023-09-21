import 'package:equatable/equatable.dart';

import '../../../../core/shared/presentation/states/page_state.dart';

class NameFormPageState extends Equatable {
  final PageState status;

  const NameFormPageState({this.status = PageState.idle});

  @override
  List<Object?> get props => [status];
}
