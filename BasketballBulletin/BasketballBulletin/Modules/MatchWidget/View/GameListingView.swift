//
//  GameListingView.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 01/08/25.
//

import SwiftUI

struct GameListingView: View {
    var body: some View {
        VStack {
            Text("Games")
                .noDataTextStyle(font: .title24Heavy)
            Text("Coming Soon...")
                .noDataTextStyle(font: .title16SemiBold)
        }
    }
}

#Preview {
    GameListingView()
}
