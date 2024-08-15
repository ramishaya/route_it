import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it/features/roadmaps/data/repos/roadmap_repo.dart';

part 'add_comment_state.dart';

class AddCommentCubit extends Cubit<AddCommentState> {
  AddCommentCubit(this.roadMapRepo) : super(AddCommentInitial());
  final RoadMapRepo roadMapRepo;

  Future<void> addComment(
      {required int roadMapSkillId, required String comment}) async {
    var finalREsponse = await roadMapRepo.addComment(
        roadMapSkillId: roadMapSkillId, comment: comment);
    finalREsponse.fold((failure) {
      print(failure.errMessage);
      print("we has not added the commmetn");
      emit(AddCommentFailure(errMessage: failure.errMessage));
    }, (success) {
      print("we add the new  comment suceesfult");
      emit(AddCommentLoaded());
    });
  }
}
