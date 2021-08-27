import 'package:flutter/widgets.dart';

class FutureWidget<T> extends StatelessWidget {
  final Future<T> future;
  final Widget Function(T) onSuccess;
  final Widget Function(String) onError;
  final Widget Function() onWait;

  const FutureWidget({
    Key? key,
    required this.future,
    required this.onSuccess,
    required this.onError,
    required this.onWait,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: future,
        builder: (_, snapshot) {
          try {
            if (snapshot.connectionState == ConnectionState.done) {
              return onSuccess(snapshot.data as T);
            } else if (snapshot.hasError) {
              return onError(snapshot.error.toString());
            } else {
              return onWait();
            }
          } catch (ex) {
            return onError(ex.toString());
          }
        },
      );
}
