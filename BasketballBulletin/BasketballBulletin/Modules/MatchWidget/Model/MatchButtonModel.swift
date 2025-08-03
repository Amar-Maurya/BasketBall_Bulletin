//
//  MatchButtonModel.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 02/08/25.
//

struct MatchButtonModel {
    let title: String
    let icon: String
    let type: ActionType
    
    enum ActionType {
        case watch
        case buy
        case highlight
        case unknown
    }
}

extension Schedule {
    var buttonModel: MatchButtonModel {
        switch gameStatus {
        case .live:
            return .init(title: "Watch", icon: "play.fill", type: .watch)
        case .future:
            return .init(title: "Buy Tickets", icon: "ticket.fill", type: .buy)
        case .past:
            return .init(title: "Highlights", icon: "film.fill", type: .highlight)
        default:
            return .init(title: "", icon: "", type: .unknown)
            
        }
    }
}
