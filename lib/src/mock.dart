import 'dart:math';

List mockTrendingJob = [
  {
    'srcImage': 'https://picsum.photos/id/${Random().nextInt(2000)}/200',
    'jobTitle': 'Some Title',
    'datePosted': 'datePosted',
    'applicantCounts': 4
  },
  {
    'srcImage': 'https://picsum.photos/id/${Random().nextInt(1000)}/200',
    'jobTitle': 'another Title',
    'datePosted': 'datePosted',
    'applicantCounts': 5
  },
  {
    'srcImage': 'https://picsum.photos/id/${Random().nextInt(2300)}/200',
    'jobTitle': 'new Title',
    'datePosted': 'datePosted',
    'applicantCounts': 2
  },
  {
    'srcImage': 'https://picsum.photos/id/${Random().nextInt(1500)}/200',
    'jobTitle': 'some another Title',
    'datePosted': 'datePosted',
    'applicantCounts': 2
  },
  {
    'srcImage': 'https://picsum.photos/id/${Random().nextInt(800)}/200',
    'jobTitle': 'Job Title',
    'datePosted': 'datePosted',
    'applicantCounts': 2
  }
];
List mockListUpcomingWidget = [
  {'date': '4/2', 'time': '9AM'},
  {'date': '4/5', 'time': '1:30PM'},
  {'date': '4/12', 'time': '9AM'}
];
