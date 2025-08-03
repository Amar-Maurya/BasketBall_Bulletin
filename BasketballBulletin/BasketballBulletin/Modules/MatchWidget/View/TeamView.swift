//
//  TeamView.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 01/08/25.
//

import SwiftUI

struct TeamView: View {
    var teamViewModel: TeamViewModel
    var body: some View {
        VStack(spacing: 8) {
            CachedAsyncImage(
                urlString: teamViewModel.teamLogo,
                placeholder: Constant.ImageConstant.placeHodler,
                size: CGSize(width: 60, height: 60)
            )
            matchHeavyTitleText(teamViewModel.teamName, font: .title18Heavy)
        }
    }
}

#Preview {
    TeamView(teamViewModel: TeamViewModel(teamName: "QBD",
                                          teamLogo: "https://images.contentstack.io/v3/assets/bltf0f8f301b0c60428/bltd3c4bdda4016dcaf/636ccedd48a3e21091d5d17d/download"))
}
