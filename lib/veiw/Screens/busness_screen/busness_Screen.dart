import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Veiw_model/Wedget/combonans.dart';
import 'package:social_app/model/cubit/cubit.dart';
import 'package:social_app/model/cubit/states.dart';

class BusnessScreen extends StatelessWidget {
  const BusnessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // Handle any side effects if needed
      },
      builder: (context, state) {
        var list = NewsCubit.get(context).business;

        if (state is NewsGetBusinessLodingState) {
          // If the state indicates loading
          return   const Center(
              child: Text(
                  "No articles available."));
        }

        if (list.isNotEmpty) {
          return ArticleBuilder(list: list);
        }

        return Center(child: CircularProgressIndicator());


         // Fallback if the list is empty
      },
    );
  }
}
