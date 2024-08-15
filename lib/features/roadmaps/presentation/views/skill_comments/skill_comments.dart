// comments_screen.dart

// ignore_for_file: library_private_types_in_public_api

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it/core/utils/constants/app_colors.dart';
import 'package:route_it/core/utils/constants/assets_data.dart';
import 'package:route_it/core/utils/helpers/helper_functions.dart';
import 'package:route_it/core/utils/local_storage/cache_services.dart';
import 'package:route_it/features/roadmaps/data/models/comments_model.dart';
import 'package:route_it/features/roadmaps/presentation/view_models/comments_cubit/comments_cubit.dart';
import 'package:route_it/features/roadmaps/presentation/view_models/add_comment_cubit/add_comment_cubit.dart';

class SkillComments extends StatefulWidget {
  final ScrollController scrollController;
  final int skillId;

  const SkillComments(
      {super.key, required this.scrollController, required this.skillId});

  @override
  _SkillCommentsState createState() => _SkillCommentsState();
}

class _SkillCommentsState extends State<SkillComments> {
  @override
  void initState() {
    BlocProvider.of<CommentsCubit>(context)
        .fetchComments(roadMapSkillId: widget.skillId);

    super.initState();
  }

  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: HelperFunctions.screenHeight(context) * 0.01),
        Center(
          child: Container(
            width: HelperFunctions.screenWidth(context) * 0.15,
            height: HelperFunctions.screenHeight(context) * 0.007,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Center(
          child: Text(
            "Comments",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: HelperFunctions.screenHeight(context) * 0.02),
        Expanded(
          child: BlocBuilder<CommentsCubit, CommentsState>(
            builder: (context, state) {
              if (state is CommentsLoading) {
                return const Center(
                  child: SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator()),
                );
              } else if (state is CommentsLoaded) {
                return ListView.builder(
                  controller: widget.scrollController,
                  padding: const EdgeInsets.all(16.0),
                  itemCount: state.comments.length,
                  itemBuilder: (context, index) {
                    return _buildComment(
                        state.comments[index].name!,
                        state.comments[index].comment!,
                        state.comments[index].image!);
                  },
                );
              } else {
                return const Center(
                  child: Text("There is no comments :("),
                );
              }
            },
          ),
        ),
        _buildInputField(context),
      ],
    );
  }

  Widget _buildComment(String username, String comment, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[800],
            child: ClipOval(
              child: image.contains("hacker.png")
                  ? Image.asset(image)
                  : CachedNetworkImage(
                      imageUrl: image,
                      fit: BoxFit
                          .cover, // Ensures the image covers the entire circle
                      width: double
                          .infinity, // Ensures the image fills the CircleAvatar
                      height: double
                          .infinity, // Ensures the image fills the CircleAvatar
                    ),
            ),
          ),
          SizedBox(width: HelperFunctions.screenWidth(context) * 0.02),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  comment,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addComment(BuildContext context) {
    final newCommentText = _commentController.text.trim();

    if (newCommentText.isNotEmpty) {


      // Assuming you're using a placeholder username and image for the new comment.
      final newComment = Comments(
        name: CacheServices.getData(
            key: "userName"), // Replace with the actual username
        comment: newCommentText,
        image: AssetsData.avatarImg, // Replace with the actual image URL
      );

      // Interact with the CommentsCubit to add the new comment
      BlocProvider.of<CommentsCubit>(context).addComment(newComment);
      BlocProvider.of<AddCommentCubit>(context)
          .addComment(roadMapSkillId: widget.skillId, comment: newCommentText);

      // Clear the input field after adding the comment
      _commentController.clear();
    }
  }

  Widget _buildInputField(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 0.06, // Thin line height
          color: Colors.white, // Line color
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context)
                .viewInsets
                .bottom, // Adjusts for keyboard
          ),
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            color:
                AppColors.darkPrimaryColor, // Background color for input field
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Add a comment...",
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(Iconsax.send1, color: AppColors.cardColors[3]),
                    onPressed: () {
                      _addComment(context);
                    }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
