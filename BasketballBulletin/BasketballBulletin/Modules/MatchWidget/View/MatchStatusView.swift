//
//  MatchStatusView.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 01/08/25.
//

import SwiftUI

struct MatchStatusView: View {
    var gameStatus: GameStatus
    var body: some View {
        matchTitleText(gameStatus.description.uppercased())
            .padding(.horizontal, 4)
            .padding(.vertical, 2)
            .matchCardStyle(color: .red)
    }
}

#Preview {
    MatchStatusView(gameStatus: GameStatus(rawValue: 2)!)
}
