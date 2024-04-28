import 'package:flutter/widgets.dart';
import 'package:talentpitch/app/models/category.dart';
import 'package:talentpitch/app/services/services.dart';
import 'package:talentpitch/app/widgets/widgets.dart';

class CompanyItemsBuilder extends StatelessWidget {
  const CompanyItemsBuilder({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: companyService.getCompanies(category.url!),
      initialData: [],
      builder: (context, items) {
        return Visibility(
          visible: items.connectionState == ConnectionState.done,
          replacement: const LoadingWidget(),
          child: Row(
            children: [
              ...items.data!.map((e) {
                return SizedBox(
                  height: 200,
                  width: 100,
                  child: Text(e.name!),
                );
              })
            ],
          ),
        );
      },
    );
  }
}
