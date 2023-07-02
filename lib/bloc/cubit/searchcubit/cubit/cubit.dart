import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/bloc/cubit/searchcubit/cubit/states.dart';
import 'package:untitled4/bloc/dio/rout.dart';
import 'package:untitled4/const/components/widget.dart';
import 'package:untitled4/models/search_model.dart';
import 'package:untitled4/bloc/dio/dio_helper.dart';



class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? model;

  void search(String text) {
    emit(SearchLoadingState());

    DioHelper.postData(
      url: SEARCH,
      token: token,
      data: {
        'text': text,
      },
    ).then((value)
    {
      model = SearchModel.fromJson(value.data);

      emit(SearchSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}