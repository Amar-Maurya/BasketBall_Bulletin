//
//  TabBarView.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 03/08/25.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedTab: TabbedMatchView.Tab

    var body: some View {
        HStack(spacing: 0) {
            ForEach(TabbedMatchView.Tab.allCases, id: \.self) { tab in
                VStack {
                    Text(tab.rawValue)
                        .font(.title16SemiBold)
                        .foregroundColor(selectedTab == tab ? .accentColor : .gray)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            Rectangle()
                                .frame(height: 3)
                                .foregroundColor(selectedTab == tab ? .accentColor : .clear)
                                .offset(y: 20)
                        )
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                selectedTab = tab
                            }
                        }
                }
            }
        }
        .padding(4)
    }
}

#Preview {
    TabBarView(selectedTab: .constant(.schedule))
}
