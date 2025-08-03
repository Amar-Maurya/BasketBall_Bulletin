//
//  MatchArenaInfoModel.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 02/08/25.
//

struct MatchArenaInfoModel {
    let name: String
    let city: String
    let state: String
}

extension Schedule {
    var matchArenaInfo: MatchArenaInfoModel {
        MatchArenaInfoModel(name: arenaName ?? "-", city: arenaCity ?? "-", state: arenaState ?? "-")
    }
}
