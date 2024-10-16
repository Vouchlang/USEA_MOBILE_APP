import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Custom_Widget/CustomText.dart';
import '../../../../theme_builder.dart';
import '../../Class_Program/Class_Program_ACCA.dart';
import '../Program_SHC_ACCA/Program_ACCA.dart';
import '../Program_Detail/Program_Major_Detail_Main.dart';

class MajorSearchDelegate extends SearchDelegate<String> {
  final List<String> majorNames;
  final List<String> filteredMajorNames;
  final Function(String) updateSearchQuery;
  final Function(String) fetchEducationNames;
  final Function(String) fetchMajorInfoData;
  final List<ProgramACCA> programACCA;

  MajorSearchDelegate({
    required this.majorNames,
    required this.filteredMajorNames,
    required this.updateSearchQuery,
    required this.fetchEducationNames,
    required this.fetchMajorInfoData,
    required this.programACCA,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
          color: UPrimaryColor,
          size: 18,
        ),
        onPressed: () {
          query = '';
          updateSearchQuery(query);
        },
      ),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    updateSearchQuery(query);

    if (filteredMajorNames.length == 1) {
      final majorName = filteredMajorNames[0];
      navigateToMajorDetails(
        context,
        majorName,
      );
      return const SizedBox.shrink();
    }

    final regularProgramResults = filteredMajorNames
        .where(
          (major) => major.toLowerCase().contains(query.toLowerCase()) && !major.contains('ACCA'),
        ) // Filter regular program results
        .toList();

    final accaProgramResults = filteredMajorNames
        .where(
          (major) => major.toLowerCase().contains(query.toLowerCase()) && major.contains('ACCA'),
        ) // Filter ACCA program results
        .toList();

    return Column(
      children: [
        // Regular Program Section
        if (regularProgramResults.isNotEmpty)
          _buildSection(
            title: 'Regular Programs',
            results: regularProgramResults,
          ),

        // ACCA Program Section
        if (accaProgramResults.isNotEmpty)
          _buildSection(
            title: 'ACCA Programs',
            results: accaProgramResults,
          ),
      ],
    );
  }

  Widget _buildSection({
    required final String title,
    required final List<String> results,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(UPdMg8),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: UFontSize18,
              color: UPrimaryColor,
            ),
          ),
        ),
        ListView.builder(
          itemCount: results.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final majorName = results[index];
            return ListTile(
              title: Text(majorName),
              onTap: () => navigateToMajorDetails(
                context,
                majorName,
              ),
            );
          },
        ),
      ],
    );
  }

  Future<void> navigateToMajorDetails(BuildContext context, String majorName) async {
    if (majorName.contains('ACCA')) {
      // Handle navigation for ACCA programs
      final programACCAObj = programACCA.firstWhere(
        (program) => program.fac_data.any(
          (facultyData) => facultyData.major_data.any(
            (majorData) => majorData.major_name == majorName,
          ),
        ),
      );

      final majorData = programACCAObj.fac_data.expand((facultyData) => facultyData.major_data).firstWhere(
            (majorData) => majorData.major_name == majorName,
          );

      Get.to(
        () => Program_ACCA(
          majorName: majorData.major_name,
          course_hour: majorData.course_hour,
          educationNames: majorData.subject_data,
        ),
        transition: Transition.rightToLeftWithFade,
        duration: const Duration(milliseconds: 100),
      );
    } else {
      // Handle navigation for regular programs
      final majorInfoData = await fetchMajorInfoData(majorName);
      final educationNames = await fetchEducationNames(majorName);

      if (majorInfoData != null && educationNames != null) {
        Get.to(
          () => MajorDetailsScreen(
            majorName: majorName,
            majorInfoData: majorInfoData,
            educationNames: educationNames,
          ),
          transition: Transition.rightToLeftWithFade,
          duration: const Duration(milliseconds: 100),
        );
      } else {
        Center(
          child: Text('គ្មានទិន្ន័យ'.tr),
        );
      }
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = majorNames
        .where(
          (major) => major.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return Container(
      color: USecondaryColor,
      child: ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          final majorName = suggestionList[index];
          return ListTile(
            minTileHeight: UHeight40,
            title: Text(
              majorName,
              style: const TextStyle(fontSize: UTitleSize),
            ),
            onTap: () => navigateToMajorDetails(
              context,
              majorName,
            ),
          );
        },
      ),
    );
  }

// Searching
  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: const AppBarTheme(
        surfaceTintColor: UBackgroundColor,
        backgroundColor: UBackgroundColor,
        shadowColor: ULightGreyColor,
        elevation: 1,
        scrolledUnderElevation: 1,
        iconTheme: IconThemeData.fallback(),
        centerTitle: false,
        titleSpacing: -10,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        fillColor: UTransParentColor,
        filled: true,
        hintStyle: TextStyle(fontSize: UTitleSize),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        selectionHandleColor: UPrimaryColor,
        cursorColor: UPrimaryColor,
      ),
    );
  }

  @override
  String get searchFieldLabel => '\tស្វែងរកមុខជំនាញ'.tr;

  @override
  TextStyle? get searchFieldStyle => const TextStyle(
        fontSize: UTitleSize16,
        color: UPrimaryColor,
      );

  @override
  Widget buildLeading(BuildContext context) {
    return buildBackBtn(
      () => Get.back(),
    );
  }
}
