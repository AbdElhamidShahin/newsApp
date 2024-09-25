import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Veiw_model/Wedget/combonans.dart';
import 'package:social_app/model/cubit/cubit.dart';
import 'package:social_app/model/cubit/states.dart';

class Search extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      builder: (BuildContext context, NewsState state) {
        var list = NewsCubit.get(context).Search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Search must not be empty';
                    }
                    return null;
                  },
                  style: const TextStyle(
                      color: Colors.black), // تأكد أن لون النص أسود
                  decoration: const InputDecoration(
                    filled: true, // يجب أن تجعل الخلفية فعّالة
                    labelText: "Search",

                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(),

                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  ),
                ),
              ),
              Expanded(child: ArticleBuilder(list: list)),
            ],
          ),
        );
      },
      listener: (BuildContext context, NewsState state) {},
    );
  }
}
