//
//  ScoreWidgetViewModel.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 01/08/25.
//

import SwiftUI
import Combine

@MainActor
class ScheduleViewModel: ObservableObject {
    @Published var scheduleList: [Schedule] = []
    @Published var isLoading = true
    @Published var errorMessage: String?
    @Published var searchText: String = ""
    @Published var filteredGroupedSections: [ScheduleSection] = []
    @Published var groupedSections: [ScheduleSection] = []

    private var cancellables = Set<AnyCancellable>()

    init() {
        observeSearchText()
        Task {
            await loadSchedules()
        }
    }

    func loadSchedules() async {
        isLoading = true
        errorMessage = nil
        await fetchScheduleMatches()
    }

    func fetchScheduleMatches() async {
        do {
            async let scheduleResponse: ScheduleResponse = JSONLoader.loadDataFromFileAsync("schedule", delayInSeconds: 2)
            async let teams: TeamResponse = JSONLoader.loadDataFromFileAsync("teams")
            let (response, teamList) = try await (scheduleResponse, teams.data.teams)

            let schedules = response.data?.schedules ?? []
            self.scheduleList = mergeLogosIntoSchedules(schedules: schedules, teams: teamList)
            self.groupedSections = getInitialFilterGroupSectionByDate()
            self.filteredGroupedSections = self.groupedSections
            self.isLoading = false
        } catch {
            print("Error: \(error.localizedDescription)")
            self.errorMessage = Constant.TextConstant.errorLoadingSchedules
            self.isLoading = false
        }
    }

    private func observeSearchText() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .map { [weak self] query in
                self?.filterGroupedSections(with: query) ?? []
            }
            .sink { [weak self] in self?.filteredGroupedSections = $0 }
            .store(in: &cancellables)
    }

    private func mergeLogosIntoSchedules(schedules: [Schedule], teams: [Team]) -> [Schedule] {
        let teamLogoMap = Dictionary(uniqueKeysWithValues: teams.map { ($0.teamId, $0.logo) })
        return schedules.map { schedule in
            var updatedSchedule = schedule
            if let home = schedule.homeTeam, let logo = teamLogoMap[home.teamId ?? ""] as? String {
                updatedSchedule.homeTeam?.logo = logo
            }
            if let away = schedule.awayTeam, let logo = teamLogoMap[away.teamId ?? ""] as? String {
                updatedSchedule.awayTeam?.logo = logo
            }
            return updatedSchedule
        }
    }
}
