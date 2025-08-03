//
//  ScoreWidgetContainer.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 01/08/25.
//

import SwiftUI

struct TabbedMatchView: View {
    @State private var selectedTab: Tab = .schedule
    @State private var isSearching = false
    @State private var searchText = ""
    @FocusState private var isSearchFieldFocused: Bool

    enum Tab: String, CaseIterable {
        case schedule = "Schedule"
        case games = "Games"
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                if isSearching && selectedTab == .schedule {
                    SearchBarView(searchText: $searchText, isSearching: $isSearching)
                        .focused($isSearchFieldFocused)
                        .onAppear { isSearchFieldFocused = true }
                }
                TabBarView(selectedTab: $selectedTab)
                Group {
                    switch selectedTab {
                    case .schedule:
                        ScheduleView(searchText: $searchText)
                    case .games:
                        GameListingView()
                    }
                }
                .frame(maxHeight: .infinity)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Team")
                        .font(.title24Heavy)
                        .foregroundColor(.primary)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    if selectedTab == .schedule {
                        Button {
                            withAnimation {
                                isSearching.toggle()
                                if !isSearching { searchText = "" }
                            }
                        } label: {
                            isSearching ? Constant.ImageConstant.xmarkCircle : Constant.ImageConstant.magnifyingGlass
                        }
                    }
                }
            }
            .onChange(of: selectedTab) { newTab in
                if newTab != .schedule {
                    isSearching = false
                    searchText = ""
                }
            }
        }

    }
}

#Preview {
    TabbedMatchView()
}
