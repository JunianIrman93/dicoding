import 'package:dicoding/src/cubit/auth_cubit.dart';
import 'package:dicoding/src/cubit/creator_cubit.dart';
import 'package:dicoding/src/models/creator_model.dart';
import 'package:dicoding/src/shared/theme.dart';
import 'package:dicoding/src/ui/widgets/custom_card.dart';
import 'package:dicoding/src/ui/widgets/shimmerwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController searchController = TextEditingController(text: '');
  List<CreatorModel> creators = [];

  @override
  void initState() {
    context.read<CreatorCubit>().fetchCreators();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome back, \n${state.user.name}",
                    style: whiteTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 48,
                    width: 48,
                    child: CircleAvatar(
                      backgroundColor: kWhiteColor,
                      child: Icon(
                        Icons.person,
                        size: 32,
                        color: kPrimaryColor,
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      );
    }

    Widget search() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: SizedBox(
          height: 56,
          child: TextField(
            controller: searchController,
            onChanged: (value) {
              context.read<CreatorCubit>().onItemChanged(value);
            },
            style: whiteTextStyle,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16),
              prefixIcon: Icon(
                Icons.search,
                color: kGreyColor,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: kWhiteColor,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kWhiteColor),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              hintText: 'Type here',
              hintStyle: greyTextStyle.copyWith(fontSize: 14),
            ),
          ),
        ),
      );
    }

    Widget discover() {
      return BlocConsumer<CreatorCubit, CreatorState>(
        listener: (context, state) {
          if (state is CreatorSuccess) {
            context.read<CreatorCubit>().addAllToCreators(state.creators);
          } else if (state is CreatorFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kRedColor,
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is CreatorSuccess) {
            return StreamBuilder(
                initialData: context.read<CreatorCubit>().creators,
                stream: context.read<CreatorCubit>().getSearchStream,
                builder: (context, snapshot) {
                  creators = snapshot.data as List<CreatorModel>;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: creators.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: defaultMargin,
                            right: defaultMargin,
                            top: creators[index] == creators.first
                                ? defaultMargin
                                : 8,
                            bottom: creators[index] == creators.last
                                ? defaultMargin
                                : 8,
                          ),
                          child: CustomCard(creatorModel: creators[index]),
                        );
                      },
                    ),
                  );
                });
          } else {
            return Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: defaultPadding,
                      right: defaultPadding,
                      top: index == 0 ? defaultPadding : 12,
                      bottom: index == 4 ? defaultPadding : 12,
                    ),
                    child: ShimmerWidget.circular(
                      width: size.width,
                      height: size.height / 3.2,
                      shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(defaultRadius),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            header(),
            search(),
            discover(),
          ],
        ),
      ),
    );
  }
}
