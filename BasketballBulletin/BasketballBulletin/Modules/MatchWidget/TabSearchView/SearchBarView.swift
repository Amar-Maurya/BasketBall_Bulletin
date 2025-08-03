//
//  SearchBarView.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 03/08/25.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool

    var body: some View {
        HStack {
            TextField(Constant.TextConstant.searchPlaceholder, text: $searchText)
                .padding(.horizontal, 12)
                .frame(height: 40)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.accentColor, lineWidth: 1)
                        .background(Color.clear.cornerRadius(10))
                )
        }
        .padding(.horizontal)
        .padding(.top, 8)
    }
}

#Preview {
    SearchBarView(searchText: .constant(""), isSearching: .constant(false))
}
