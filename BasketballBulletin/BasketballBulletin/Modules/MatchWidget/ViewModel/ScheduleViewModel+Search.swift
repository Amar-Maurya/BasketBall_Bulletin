//
//  ScheduleViewModel+Search.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 03/08/25.
//

extension ScheduleViewModel {
    
    func getInitialFilterGroupSectionByDate() -> [ScheduleSection] {
        let validSchedules = scheduleList.compactMap { schedule -> (String, Schedule)? in
            guard let dateStr = schedule.gametime,
                  let date = dateStr.toDate() else {
                return nil
            }
            let key = date.monthYearString()
            return (key, schedule)
        }
        
        let grouped = Dictionary(grouping: validSchedules, by: { $0.0 })
        
        return grouped
            .mapValues { $0.map { $0.1 }
                    .sorted { ($0.gametime?.toDate() ?? .distantPast) > ($1.gametime?.toDate() ?? .distantPast) }
            }
            .map { ScheduleSection(section: $0.key, matches: $0.value) }
            .sorted {
                guard let d1 = $0.matches.first?.gametime?.toDate(),
                      let d2 = $1.matches.first?.gametime?.toDate() else { return false }
                return d1 > d2
            }
    }
    
    func filterGroupedSections(with query: String? = nil) -> [ScheduleSection] {
        guard let query else {
            return groupedSections
        }
        let trimmedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        guard !trimmedQuery.isEmpty else {
            return groupedSections
        }
        
        return groupedSections.compactMap { section in
            let filteredMatches = section.matches.filter { schedule in
                let homeTeam = schedule.homeTeam?.teamName?.lowercased() ?? ""
                let awayTeam = schedule.awayTeam?.teamName?.lowercased() ?? ""
                let matchTitle = schedule.matchTitle?.lowercased() ?? ""
                let arena = schedule.arenaName?.lowercased() ?? ""
                let city = schedule.arenaCity?.lowercased() ?? ""
                
                return homeTeam.contains(trimmedQuery)
                || awayTeam.contains(trimmedQuery)
                || matchTitle.contains(trimmedQuery)
                || arena.contains(trimmedQuery)
                || city.contains(trimmedQuery)
            }
            
            if filteredMatches.isEmpty {
                return nil
            }
            
            return ScheduleSection(section: section.section, matches: filteredMatches)
        }
    }
}
