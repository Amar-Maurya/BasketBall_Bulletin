//
//  MatchHeaderInfoModel.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 02/08/25.
//

enum MatchPlaceType: String {
    case home
    case away
    case unknown
}

struct MatchHeaderInfoModel {
    let matchPlaceType: MatchPlaceType
    let matchDate: String
    let matchTime: String
    let matchTitle: String?
    let matchClock: String?
    let gameStatus: GameStatus?
}

extension Schedule {
    var headerInfoModel: MatchHeaderInfoModel {
        let date = gametime?.toDate()
        let matchDate = date?.dayMonthString() ?? ""
        let matchTime = date?.timeString() ?? ""

        let placeType: MatchPlaceType
        if let homeTeamName = homeTeam?.teamName?.lowercased(),
           let arenaCityName = arenaCity?.lowercased(), !homeTeamName.isEmpty, !arenaCityName.isEmpty {
            placeType = homeTeamName == arenaCityName ? .home : .away
        } else {
            placeType = .unknown
        }

        return MatchHeaderInfoModel(
            matchPlaceType: placeType,
            matchDate: matchDate,
            matchTime: matchTime,
            matchTitle: matchTitle,
            matchClock: matchClockTime,
            gameStatus: gameStatus
        )
    }
}
