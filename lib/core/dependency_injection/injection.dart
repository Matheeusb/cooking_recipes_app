import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final GetIt dependencies = GetIt.instance;

@injectableInit
void configureInjection() => dependencies.init();
