//
//  MatchButtonView.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 01/08/25.
//

import SwiftUI

struct MatchButtonView: View {
    let buttonModel: MatchButtonModel
    var body: some View {
        Button {
            handleAction(buttonModel.type)
        } label: {
            Label(buttonModel.title, systemImage: buttonModel.icon)
                .font(.title16SemiBold)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, minHeight: 40)
        }
        .matchCardStyle()
    }

    func handleAction(_ type: MatchButtonModel.ActionType) {
        switch type {
        case .watch:
            print("Watch match")
        case .buy:
            print("Buy ticket")
        case .highlight:
            print("Show highlights")
        case .unknown:
            print("unknown")
        }
    }
}


#Preview {
    MatchButtonView(buttonModel: MatchButtonModel(title: "Watch", icon: "play.fill", type: .watch))
}
