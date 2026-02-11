// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:news_app/core/enums/stats.dart';
// import 'package:news_app/features/home/domain/entities/post_entitiy.dart';

// part 'search_state.dart';

// class SearchCubit extends Cubit<SearchState> {
//   SearchCubit() : super(SearchState());
//   final GetNewsByCategory getNews;
//   final AppConnectionCubit _connectionCubit;

//   Future<void> search(String query) async {
//     emit(state.copyWith(searchStatus: NewsStatus.loading, searchQuery: query));
//     final response = await searchUseCase.call(query);
//     response.when(
//       success: (posts) {
//         emit(
//           state.copyWith(
//             searchStatus: NewsStatus.loaded,
//             searchResults: posts,
//           ),
//         );
//       },
//       failure: (errorMessage) {
//         emit(
//           state.copyWith(
//             searchStatus: NewsStatus.error,
//             errorMessage: errorMessage.message,
//           ),
//         );
//       },
//     );
//   }
// }
