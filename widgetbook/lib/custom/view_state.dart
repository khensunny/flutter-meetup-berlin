import 'dart:async';

/// All screens are a combination of "views".
/// A screen can be in one of four states:
/// - loading: The screen is currently loading data.
/// - empty: The screen loaded has no data to display.
/// - data: The screen loaded data and is displaying it.
/// - error: The screen failed to load data.
enum ViewState { loading, empty, data, error }

extension ViewStateMapper on ViewState {
  FutureOr<T> map<T>({required T data, T? empty}) {
    return switch (this) {
      ViewState.loading => Completer<T>().future,
      ViewState.error => Future.error('Error'),
      ViewState.data => data,
      ViewState.empty => empty ?? (throw Exception('No empty state provided')),
    };
  }
}
