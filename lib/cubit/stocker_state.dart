import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/models/stocker.dart';

part 'stocker_state.g.dart';

enum StockerStatus { init, loading, success, error }

@CopyWith()
class StockerState extends Equatable {
  const StockerState({this.stockers, this.status = StockerStatus.init});
  final List<Stocker>? stockers;
  final StockerStatus status;

  @override
  List<Object?> get props => [stockers, status];
}
