//
//  CollapsibleSectionHeader.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 02/08/25.
//

import SwiftUI

struct CollapsibleSectionHeader: View {
    let title: String
    let isExpanded: Bool
    let toggle: () -> Void

    var body: some View {
        Button(action: toggle) {
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
                isExpanded ? Constant.ImageConstant.upArrow : Constant.ImageConstant.downArrow
            }
            .padding(.horizontal)
            .frame(height: 50)
            .background(Color(UIColor.systemGray6))
            
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    CollapsibleSectionHeader(title: "JULY 2025", isExpanded: true, toggle: {})
}
