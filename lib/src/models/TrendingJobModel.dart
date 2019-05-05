import 'package:meta/meta.dart';

class TrendingJobModel {
  final String srcImage;
  final String jobTitle;
  final String datePosted;
  final int applicantCounts;
  TrendingJobModel(
      {@required this.srcImage,
      @required this.jobTitle,
      @required this.datePosted,
      @required this.applicantCounts});
  factory TrendingJobModel.fromJSON(Map<String, dynamic> parsedJson) {
    return TrendingJobModel(
        srcImage: parsedJson['srcImage'],
        jobTitle: parsedJson['jobTitle'],
        datePosted: parsedJson['datePosted'],
        applicantCounts: parsedJson['applicantCounts']);
  }
}
