import 'package:dicoding/src/models/creator_model.dart';
import 'package:dicoding/src/shared/theme.dart';
import 'package:dicoding/src/ui/widgets/shimmerwidget.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final CreatorModel creatorModel;
  const DetailPage(this.creatorModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    Widget backButton() {
      return Padding(
        padding: EdgeInsets.symmetric(
          vertical: 48,
          horizontal: defaultPadding,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: kWhiteColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back_ios_rounded),
          ),
        ),
      );
    }

    Widget backgroundImage() {
      return Hero(
        tag: creatorModel.id,
        child: Image(
          height: size.height / 2.4,
          width: size.width,
          image: NetworkImage(creatorModel.imageUrl),
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            return loadingProgress == null
                ? child
                : ShimmerWidget.circular(
                    width: size.width,
                    height: size.height / 4.2,
                    shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                  );
          },
        ),
      );
    }

    Widget description() {
      return ListView(
        children: [
          Container(
            width: size.width,
            margin: EdgeInsets.only(top: size.height / 3.2),
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(defaultRadius),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            creatorModel.name,
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            creatorModel.itemName,
                            style: whiteTextStyle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "${creatorModel.price.toString()} ETH",
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  creatorModel.desc +
                      "\n" +
                      creatorModel.desc +
                      "\n" +
                      creatorModel.desc +
                      "\n" +
                      creatorModel.desc,
                  style: whiteTextStyle,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          backgroundImage(),
          description(),
          backButton(),
        ],
      ),
    );
  }
}
