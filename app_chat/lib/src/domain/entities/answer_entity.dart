import 'package:common_deps/common_deps.dart';

class AnswerEntity extends Equatable {
  final int value;
  
  const AnswerEntity({
    required this.value
  });

  @override
  List<Object?> get props => [value];
}