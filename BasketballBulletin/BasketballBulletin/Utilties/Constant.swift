//
//  Constant.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 02/08/25.
//

import SwiftUI

enum Constant {
    
    enum ImageConstant {
        static let placeHodler = Image("team-logo-placeholder")
        static let xmarkCircle = Image(systemName: "xmark.circle")
        static let magnifyingGlass = Image(systemName: "magnifyingglass")
        static let upArrow = Image(systemName: "chevron.up")
        static let downArrow = Image(systemName: "chevron.down")
    }
    
    enum TextConstant {
        static let searchPlaceholder = "Search team, arena or city"
        static let noMatchFound = "No matches found"
        static let loadingMatch = "Loading match..."
        static let errorLoadingSchedules = "Failed to load schedules. Please try again."
        
    }
    
    static let teamPrimaryColors: [String: Color] = [
        "ATL": Color(hex: "#E03A3E"),
        "BKN": Color(hex: "#000000"),
        "BOS": Color(hex: "#007A33"),
        "CHA": Color(hex: "#1D1160"),
        "CHI": Color(hex: "#CE1141"),
        "CLE": Color(hex: "#6F263D"),
        "DAL": Color(hex: "#00538C"),
        "DEN": Color(hex: "#0E2240"),
        "DET": Color(hex: "#C8102E"),
        "GSW": Color(hex: "#1D428A"),
        "HOU": Color(hex: "#CE1141"),
        "IND": Color(hex: "#002D62"),
        "LAC": Color(hex: "#C8102E"),
        "LAL": Color(hex: "#552583"),
        "MEM": Color(hex: "#5D76A9"),
        "MIA": Color(hex: "#98002E"),
        "MIL": Color(hex: "#00471B"),
        "MIN": Color(hex: "#0C2340"),
        "NOP": Color(hex: "#0C2340"),
        "NYK": Color(hex: "#006BB6"),
        "OKC": Color(hex: "#007AC1"),
        "ORL": Color(hex: "#0077C0"),
        "PHI": Color(hex: "#006BB6"),
        "PHX": Color(hex: "#1D1160"),
        "POR": Color(hex: "#E03A3E"),
        "SAC": Color(hex: "#5A2D81"),
        "SAS": Color(hex: "#C4CED4"),
        "TOR": Color(hex: "#CE1141"),
        "UTA": Color(hex: "#002B5C"),
        "WAS": Color(hex: "#002B5C")
    ]


}

