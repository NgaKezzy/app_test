import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/models/goods_votes.dart';
import 'package:test_app/models/receipt.dart';
part 'receipt_state.g.dart';

enum ReceiptStatus { init, loading, success, error }

@CopyWith()
class ReceiptState extends Equatable {
  const ReceiptState(
      {this.receipts, this.goodsVotes, this.status = ReceiptStatus.init});

  final List<Receipt>? receipts;
  final List<GoodsVotes>? goodsVotes;
  final ReceiptStatus status;
  @override
  List<Object?> get props => [receipts, goodsVotes, status];
}
