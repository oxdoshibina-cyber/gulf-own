import 'package:dartz/dartz.dart';

import 'app_failure.dart';

typedef FutureEither<T> = Future<Either<AppFailure, T>>;
typedef EitherFailure<T> = Either<AppFailure, T>;
typedef VoidCallBack = void Function();
