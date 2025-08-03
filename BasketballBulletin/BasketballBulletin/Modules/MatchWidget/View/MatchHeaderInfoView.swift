//
//  MatchHeaderInfoView.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 01/08/25.
//

import SwiftUI

struct MatchHeaderInfoView: View {
    var matchHeaderInfo: MatchHeaderInfoModel

    var body: some View {
        HStack(spacing: 8) {
            if shouldShowMatchPlace {
                self.matchTitleText(matchHeaderInfo.matchPlaceType.rawValue.uppercased())
                self.verticalDivider()
            }
            if let primaryText = primaryMatchText {
                self.matchTitleText(primaryText)
            }
            if let secondaryText = secondaryMatchText {
                self.verticalDivider()
                self.matchTitleText(secondaryText.uppercased())
            }
        }
    }

    // MARK: - Helper Computed Properties

    private var shouldShowMatchPlace: Bool {
        matchHeaderInfo.matchPlaceType != .unknown && matchHeaderInfo.gameStatus != .live
    }

    private var primaryMatchText: String? {
        matchHeaderInfo.gameStatus == .live ? matchHeaderInfo.matchTitle : matchHeaderInfo.matchDate
    }

    private var secondaryMatchText: String? {
        switch matchHeaderInfo.gameStatus {
        case .future:
            return matchHeaderInfo.matchTime
        case .past:
            return matchHeaderInfo.matchTitle
        case .live:
            return matchHeaderInfo.matchClock
        default:
            return nil
        }
    }

}

#Preview {
    MatchHeaderInfoView(matchHeaderInfo: MatchHeaderInfoModel(matchPlaceType: .unknown, matchDate: "13 APRIL", matchTime: "7:30 PM", matchTitle: "Final", matchClock: "0:16:00", gameStatus: GameStatus(rawValue: 1)!))
}
