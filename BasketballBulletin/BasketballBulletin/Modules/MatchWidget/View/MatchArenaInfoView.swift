//
//  MatchArenaInfoView.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 02/08/25.
//

import SwiftUI

struct MatchArenaInfoView: View {
    var matchHeaderInfo: MatchArenaInfoModel
    var body: some View {
        VStack(spacing: 8) {
            self.matchTitleText(matchHeaderInfo.city)
            self.matchTitleText(matchHeaderInfo.name)
            self.matchTitleText(matchHeaderInfo.state)
                .hidden()
        }
    }
}

#Preview {
    MatchArenaInfoView(matchHeaderInfo: MatchArenaInfoModel(name: "Bhandup", city: "Mumbai", state: "Maharashtra"))
}

