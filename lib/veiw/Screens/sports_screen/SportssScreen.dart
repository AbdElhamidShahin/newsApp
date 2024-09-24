import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Veiw_model/Wedget/combonans.dart';
import '../../../model/cubit/cubit.dart';
import '../../../model/cubit/states.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // Handle any side effects if needed
      },
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;

        if (state is NewsGetBusinessLodingState) {
          // If the state indicates loading
          return const Center(child: CircularProgressIndicator());
        }

        if (list.isNotEmpty) {
          return ArticleBuilder(list: list);
        }

        return const Center(
            child: Text(
                "No articles available.")); // Fallback if the list is empty
      },
    );
  }
}
