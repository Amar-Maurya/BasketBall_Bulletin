//
//  TeamModel.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 02/08/25.
//

struct TeamResponse: Codable {
    let data: TeamData
}

struct TeamData: Codable {
    let teams: [Team]
}

struct Team: Codable {
    let teamId: String?
    let teamShortName: String?
    let teamName: String?
    let score: String?
    var logo: String?

    enum CodingKeys: String, CodingKey {
        case teamId = "tid"
        case teamShortName = "ta"
        case teamName = "tc"
        case score = "s"
        case logo
    }
}

struct TeamViewModel {
    var teamName: String
    var teamLogo: String
}

extension Schedule {
    var homeTeamViewModel: TeamViewModel? {
        guard let team = homeTeam else { return nil }
        return TeamViewModel(
            teamName: team.teamShortName ?? team.teamName ?? "",
            teamLogo: team.logo ?? ""
        )
    }

    var awayTeamViewModel: TeamViewModel? {
        guard let team = awayTeam else { return nil }
        return TeamViewModel(
            teamName: team.teamShortName ?? team.teamName ?? "",
            teamLogo: team.logo ?? ""
        )
    }
}
