import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/models/part.dart';

part 'part_state.g.dart';

enum PartStatus { init, loading, success, error }

@CopyWith()
class PartState extends Equatable {
  const PartState({this.parts, this.status = PartStatus.init});
  final List<Part>? parts;
  final PartStatus status;

  @override
  List<Object?> get props => [parts, status];
}
