import 'package:core/helpers/helpers.dart';

class LoadingMessageState extends UIState {
  final int messageIndex;
  const LoadingMessageState(this.messageIndex) : super('');

  @override
  List<Object> get props => [messageIndex];
}

class WaitingSendQuizState extends UIState {
  const WaitingSendQuizState() : super('');

  @override
  List<Object> get props => [];
}
