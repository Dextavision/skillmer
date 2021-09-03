import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillmer/shared/models/comment_model.dart';

final commentProvider =
    StateNotifierProvider<CommentAsyncNotifier, AsyncValue<Comment>>((ref) {
  return CommentAsyncNotifier(ref.read);
});

class CommentAsyncNotifier extends StateNotifier<AsyncValue<Comment>> {
  CommentAsyncNotifier(this.read) : super(AsyncLoading()) {}

  final Reader read;

  // Future<List<Comment>> getPostComments() async {

  // }

  // Future<List<Comment>> getCommentsFromComment() {}
}
