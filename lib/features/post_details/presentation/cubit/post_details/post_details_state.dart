import 'package:equatable/equatable.dart';
import 'package:news_app/features/home/domain/entities/post_entitiy.dart';

sealed class PostDetailsState extends Equatable {
  const PostDetailsState();

  @override
  List<Object> get props => [];
}

final class PostDetailsInitial extends PostDetailsState {}

final class PostDetailsLoading extends PostDetailsState {}

final class PostDetailsLoaded extends PostDetailsState {
  final PostEntity post;
  const PostDetailsLoaded({required this.post});
  @override
  List<Object> get props => [post];
}

final class PostDetailsError extends PostDetailsState {
  final String errorMessage;
  const PostDetailsError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
