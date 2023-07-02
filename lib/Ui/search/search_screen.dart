import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/bloc/cubit/searchcubit/cubit/cubit.dart';
import 'package:untitled4/bloc/cubit/searchcubit/cubit/states.dart';
import 'package:untitled4/const/components/widget.dart';
import 'package:untitled4/models/search_model.dart';



class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1,
                        child: defaultFormField(
                          colors: Theme.of(context).accentColor,
                          controller: searchController,
                          type: TextInputType.text,
                          hint: "Search product",
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'enter text to search';
                            }

                            return null;
                          },
                          onSubmit: (text) {
                            SearchCubit.get(context).search(text);
                          },
                          label: 'Search product',
                          prefix: Icons.search,
                        ),
                      ),

                      SizedBox(
                        height: 10.0,
                      ),

                      SizedBox(
                        height: 10.0,
                      ),
                      if (state is SearchSuccessState)
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, i) => buildListProduct(
                              SearchCubit.get(context).model!.data!.data![i],context
                            ),
                            itemCount: SearchCubit.get(context)
                                .model!
                                .data!
                                .data!
                                .length,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


Widget buildListProduct(
    Product  model,BuildContext context

    ) =>
    Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(15.0),),


          child: Column(
            children: [
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  SizedBox(width: 20),
                  Container(
                    height: 59,
                    width: 59,

                    child: Image.network(
                      model.image!,
                      width: 79,
                      height: 79,
                      fit: BoxFit.fitHeight,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 160,
                          height: 40,
                          child: Text(
                            model.name!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                fontFamily: 'Nunito Sans',
                                height: 1.5,
                                fontSize: 14,
                                fontWeight: FontWeight.w700
                            )


                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 180,
                              child: Text(
                                "  \t\$ ${model.price.toString()}",
                                style: TextStyle(
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 17,
                                  color: const Color(0xffff7750),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),

                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        )
    );