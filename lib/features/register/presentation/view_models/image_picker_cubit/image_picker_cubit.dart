import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'image_picker_state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  ImagePickerCubit() : super(ImagePickerInitial());
  static ImagePickerCubit get(context) => BlocProvider.of(context);


  File? selectedImage;

  Future pickImageFromGallery() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null) return;
    selectedImage = File(image.path);
    emit(ChangeImagePicker());
  }

  Future pickImageFromCamera() async{
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if(image == null) return;
    selectedImage = File(image.path);
    emit(ChangeImagePicker());
  }
}