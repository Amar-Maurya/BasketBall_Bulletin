//
//  MatchCardView.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 01/08/25.
//

import SwiftUI

struct MatchCardView: View {
    let scoreWidgetData: Schedule?
    var backgroundColor: Color {
        let shortName = scoreWidgetData?.headerInfoModel.matchPlaceType == .home ? scoreWidgetData?.homeTeamViewModel?.teamName : nil
        return Constant.teamPrimaryColors[shortName ?? ""]?.opacity(0.8) ?? Color.black.opacity(0.8)
    }
    var body: some View {
        VStack(spacing: 8) {
            if let header = scoreWidgetData?.headerInfoModel {
                MatchHeaderInfoView(matchHeaderInfo: header)
            }

            HStack(spacing: 8) {
                if let awayVM = scoreWidgetData?.awayTeamViewModel {
                    TeamView(teamViewModel: awayVM)
                }

                if scoreWidgetData?.gameStatus == .future {
                    Spacer()
                    if let arenaInfo = scoreWidgetData?.matchArenaInfo {
                        MatchArenaInfoView(matchHeaderInfo: arenaInfo)
                    }
                    Spacer()
                } else if let scoreModel = scoreWidgetData?.matchScoreModel {
                    ScoreView(matchScoreModel: scoreModel)
                }

                if let homeVM = scoreWidgetData?.homeTeamViewModel {
                    TeamView(teamViewModel: homeVM)
                }
            }

            if let buttonModel = scoreWidgetData?.buttonModel {
                MatchButtonView(buttonModel: buttonModel)
            }
        }
        .mainMatchCardStyle(backgroundColor: backgroundColor)
    }
}


#Preview {
    MatchCardView(scoreWidgetData: Schedule(id: "", year: 2025, leagueID: "", seasonID: "", homeTeam: Team(teamId: "", teamShortName: "AQI", teamName: "", score: "0", logo: ""), awayTeam: Team(teamId: "", teamShortName: "BAQ", teamName: "", score: "0", logo: ""), buyTicket: "", isGameNecessary: "", gametime: "2025-04-13T17:00:00.000Z", arenaName: "", arenaCity: "", arenaState: "", gameStatus: .future, matchTitle: "Final", matchClockTime: "0:00:00"))
}
