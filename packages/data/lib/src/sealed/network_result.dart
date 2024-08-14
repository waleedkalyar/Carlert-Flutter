// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/

sealed class NetworkResult<T> {
  const NetworkResult();
}

class NetworkSuccess<T> extends NetworkResult<T> {
  final Object data;

  const NetworkSuccess({required this.data});
}

class NetworkLoading<T> extends NetworkResult<T> {
  final int progress;
  final String message;

  const NetworkLoading({this.progress = 0, this.message = ""});
}

class NetworkError<T> extends NetworkResult<T> {
  final String message;

  const NetworkError({required this.message});
}
