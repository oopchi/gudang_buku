class DataOrError<T> {
  const DataOrError({
    T? data,
    String? errorMessage,
  })  : _errorMessage = errorMessage,
        _data = data;

  final T? _data;
  T get data => _data!;

  final String? _errorMessage;
  String get errorMessage => _errorMessage ?? '';

  bool get hasError => _errorMessage != null;
}
