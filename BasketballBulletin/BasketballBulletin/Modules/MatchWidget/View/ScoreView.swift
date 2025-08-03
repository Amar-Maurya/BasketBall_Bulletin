//
//  ScoreView.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 01/08/25.
//

import SwiftUI

struct ScoreView: View {
    var matchScoreModel: MatchScoreModel
    var body: some View {
        VStack(spacing: 8) {
            if matchScoreModel.isLive {
                MatchStatusView(gameStatus: .live)
            }
            HStack(spacing: 24) {
                matchHeavyTitleText(matchScoreModel.awayTeamScore)
                matchHeavySubTitleText(matchScoreModel.isHomeTeam ? "VS" : "@")
                matchHeavyTitleText(matchScoreModel.homeTeamScore)
            }
        }
    }
}

#Preview {
    ScoreView(matchScoreModel:
                MatchScoreModel(homeTeamScore: "140",
                                awayTeamScore: "100",
                                isHomeTeam: false,
                                isLive: true))
}
