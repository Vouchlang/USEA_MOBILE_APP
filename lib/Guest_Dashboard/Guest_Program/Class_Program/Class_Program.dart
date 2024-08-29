class ProgramDataModel {
 late final Map<String, Map<String, dynamic>> programData;

  ProgramDataModel({
    required this.programData,
  });

  factory ProgramDataModel.fromJson(Map<String, dynamic> json) {
    return ProgramDataModel(
      programData: Map<String, Map<String, dynamic>>.from(json['program_data']),
    );
  }
}
