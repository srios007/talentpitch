import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentpitch/app/models/category.dart';
import 'package:talentpitch/app/routes/app_pages.dart';
import 'package:talentpitch/app/services/services.dart';
import 'package:talentpitch/app/utils/utils.dart';
import 'package:talentpitch/app/widgets/widgets.dart';

class ChallengeItemsBuilder extends StatelessWidget {
  const ChallengeItemsBuilder({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: challengeService.getChallenges(category.url!),
      initialData: [],
      builder: (context, items) {
        return Visibility(
          visible: items.connectionState == ConnectionState.done,
          replacement: const LoadingWidget(),
          child: Row(children: [
            ...items.data!.map((e) {
              return GestureDetector(
                onTap: () => Get.toNamed(Routes.VIDEO_PLAYER, arguments: {
                  'title': e.companyName,
                  'urlVideo': e.video,
                }),
                child: Container(
                  height: 250,
                  width: 120,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Palette.gray, width: 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(e.image!),
                      ),
                      Text(
                        e.companyName!,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                      Text(
                        e.requirements!,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              );
            })
          ]),
        );
      },
    );
  }
}
