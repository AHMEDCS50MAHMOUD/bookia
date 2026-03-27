import 'package:bookia/core/widgets/app_back_button.dart';
import 'package:bookia/core/widgets/app_text_form_field.dart';
import 'package:bookia/features/home/presentation/widgets/books_grid_view.dart';
import 'package:bookia/features/search/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        leading: AppBackButton(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  AppTextFormField(labelText: "search",
                  onChanged: (t){
                    context.read<SearchCubit>().searchAction(t);
                  },
                  ),
                  SizedBox(height: 20.h,),

                ],
              ),
            ),
            BlocBuilder<SearchCubit, SearchState>(
              buildWhen: (previous, current) => current is SearchSuccess||current is SearchLoading||current is SearchError,
              builder: (context, state) {
                if(state is SearchLoading){
                  return BooksGridview(books: [],);
                }else if(state is SearchSuccess){
                  return BooksGridview(books: state.books,isLoading: false,);
                }else{
                  return SliverToBoxAdapter(child: Center(child: Text("No Books Found")));
                }
              },
            )

          ],
        ),
      ),

    );
  }
}
