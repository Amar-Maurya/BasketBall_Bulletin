//
//  MatchScoreModel.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 03/08/25.
//

struct MatchScoreModel {
    var homeTeamScore: String
    var awayTeamScore: String
    var isHomeTeam: Bool
    var isLive: Bool = false
}

extension Schedule {
    var matchScoreModel: MatchScoreModel? {
        guard let homeScore = homeTeam?.score,
              let awayScore = awayTeam?.score else {
            return nil
        }
        let isHome = headerInfoModel.matchPlaceType == .home
        return MatchScoreModel(
            homeTeamScore: homeScore,
            awayTeamScore: awayScore,
            isHomeTeam: isHome,
            isLive: gameStatus?.isLive ?? false
        )
    }
}
