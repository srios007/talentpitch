import 'package:flutter/material.dart';
import 'package:talentpitch/app/models/category.dart';
import 'package:talentpitch/app/modules/home/controllers/home_controller.dart';
import 'package:talentpitch/app/services/services.dart';
import 'package:talentpitch/app/utils/utils.dart';
import 'package:talentpitch/app/widgets/widgets.dart';

class CompanyItemsBuilder extends StatelessWidget {
  const CompanyItemsBuilder({
    super.key,
    required this.category,
    required this.controller,
  });

  final Category category;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: companyService.getCompanies(category.url!),
      initialData: [],
      builder: (context, items) {
        return Visibility(
          visible: items.connectionState == ConnectionState.done,
          replacement: const LoadingWidget(),
          child: Row(children: [
            ...items.data!.map((e) {
              return GestureDetector(
                onTap: () => controller.validateGoToVideoPlayer(
                  urlVideo: e.video,
                  title: e.name,
                  subtitle: e.description,
                  label: e.city,
                  imageUrl: e.logo,
                ),
                child: Container(
                  height: 250,
                  width: 120,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Palette.blue, width: 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(e.logo!),
                      ),
                      Text(
                        e.name!,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                      Text(
                        e.city!,
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
