import 'package:dicoding/src/models/creator_model.dart';
import 'package:dicoding/src/shared/theme.dart';
import 'package:dicoding/src/ui/pages/detail_page.dart';
import 'package:dicoding/src/ui/widgets/shimmerwidget.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final CreatorModel creatorModel;
  const CustomCard({required this.creatorModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(creatorModel),
          ),
        );
      },
      child: Hero(
        tag: creatorModel.id,
        child: SizedBox(
          width: size.width,
          height: size.height / 4.2,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(defaultRadius),
                child: Image(
                  height: size.height / 4.2,
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
                              borderRadius:
                                  BorderRadius.circular(defaultRadius),
                            ),
                          );
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 48,
                    width: size.width / 4.8,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          kWhiteColor.withOpacity(0.16),
                          kGreyColor.withOpacity(0.4)
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(defaultRadius),
                        bottomLeft: Radius.circular(defaultRadius),
                      ),
                    ),
                    child: Text(
                      "${creatorModel.price.toString()} ETH",
                      style: whiteTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    height: 48,
                    width: size.width,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          kWhiteColor.withOpacity(0.16),
                          kGreyColor.withOpacity(0.4)
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(defaultRadius),
                        bottomRight: Radius.circular(defaultRadius),
                      ),
                    ),
                    child: Text(
                      creatorModel.name,
                      style: whiteTextStyle,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
