//
//  ScoreWidgetListingView.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 01/08/25.
//

import SwiftUI

struct ScheduleView: View {
    @Binding var searchText: String
    @StateObject private var viewModel = ScheduleViewModel()
    @State private var expandedSections: Set<String> = []

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView(Constant.TextConstant.loadingMatch)
            } else if viewModel.errorMessage != nil {
                matchHeavyTitleNoDataText(Constant.TextConstant.errorLoadingSchedules, font: .title18Medium)
            } else if viewModel.filteredGroupedSections.isEmpty {
                matchHeavyTitleNoDataText(Constant.TextConstant.noMatchFound, font: .title18Medium)
            }  else {
                matchList
            }
        }
        .onReceive(viewModel.$filteredGroupedSections) {  newValue in
            handleSectionExpansion()
        }
        .onChange(of: searchText) { newValue in
            viewModel.searchText = newValue
        }
    }

    private var matchList: some View {
        List {
            ForEach(viewModel.filteredGroupedSections) { section in
                Section(
                    header: CollapsibleSectionHeader(
                        title: section.section,
                        isExpanded: isSectionExpanded(section.section),
                        toggle: { toggleSection(section.section) }
                    )
                ) {
                    if isSectionExpanded(section.section) {
                        ForEach(section.matches) { schedule in
                            MatchCardView(scoreWidgetData: schedule)
                                .listRowInsets(EdgeInsets())
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.clear)
                        }
                    }
                }
            }
        }
        .listStyle(.plain)
        .padding(.horizontal, 0)
        .padding(.vertical, 0)
    }

    private func toggleSection(_ section: String) {
        if expandedSections.contains(section) {
            expandedSections.remove(section)
        } else {
            expandedSections.insert(section)
        }
    }

    private func isSectionExpanded(_ section: String) -> Bool {
        expandedSections.contains(section)
    }

    private func handleSectionExpansion() {
        if !searchText.isEmpty {
            expandedSections = Set(viewModel.filteredGroupedSections.map { $0.section })
        } else if let first = viewModel.groupedSections.first {
            expandedSections = [first.section]
        }
    }
}

#Preview {
    ScheduleView(searchText: .constant(""))
}
