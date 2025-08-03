//
//  ScheduleResponse.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 02/08/25.
//

import Foundation

struct ScheduleSection: Identifiable {
    let id = UUID()
    let section: String
    let matches: [Schedule]
}

struct ScheduleResponse: Codable {
    let data: ScheduleData?
}

struct ScheduleData: Codable {
    let schedules: [Schedule]?
}

struct Schedule: Codable, Identifiable {
    let id: String?
    let year: Int?
    let leagueID: String?
    let seasonID: String?
    var homeTeam: Team?
    var awayTeam: Team?
    let buyTicket: String?
    let isGameNecessary: String?
    let gametime: String?
    let arenaName: String?
    let arenaCity: String?
    let arenaState: String?
    let gameStatus: GameStatus?
    let matchTitle: String?
    let matchClockTime: String?

    enum CodingKeys: String, CodingKey {
        case id = "uid"
        case year
        case leagueID = "league_id"
        case seasonID = "season_id"
        case homeTeam = "h"
        case awayTeam = "v"
        case buyTicket = "buy_ticket_url"
        case isGameNecessary = "is_game_necessary"
        case gametime
        case arenaName = "arena_name"
        case arenaCity = "arena_city"
        case arenaState = "arena_state"
        case gameStatus = "st"
        case matchTitle = "stt"
        case matchClockTime = "cl"
    }
}

enum GameStatus: Int, Codable {
    case future = 1
    case live = 2
    case past = 3
    case unknown = 0

    var description: String {
        switch self {
        case .future: return "Upcoming"
        case .live: return "Live"
        case .past: return "Concluded"
        case .unknown: return "Unknown"
        }
    }

    var isLive: Bool {
        self == .live
    }
}
