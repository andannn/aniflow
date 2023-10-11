class AiringSchedulesQueryParam {
  final int airingAtGreater;
  final int airingAtLesser;

  AiringSchedulesQueryParam(
      {required this.airingAtGreater, required this.airingAtLesser});
}

String get airingSchedulesQueryGraphQLString => '''
query(\$airingAt_greater: Int, \$airingAt_lesser: Int){
  Page(page: 1) {
    airingSchedules(airingAt_greater: \$airingAt_greater, airingAt_lesser: \$airingAt_lesser) {
      id
      airingAt
      timeUntilAiring
      episode
      mediaId
    }
  }
}
''';
