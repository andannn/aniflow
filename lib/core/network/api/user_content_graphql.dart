String get userContentQueryGraphql => '''
          id
          name
          siteUrl
          avatar {
            large
          }
          bannerImage
          options {
            profileColor
          }
''';

String get userContentWithSettingsQueryGraphql => '''
          id
          name
          avatar {
            large
            medium
          }
          bannerImage
          unreadNotificationCount
          options {
            titleLanguage
            displayAdultContent
            airingNotifications
            profileColor
            timezone
            activityMergeTime
            staffNameLanguage
            restrictMessagesToFollowing
          }
          mediaListOptions {
            scoreFormat
          }
''';