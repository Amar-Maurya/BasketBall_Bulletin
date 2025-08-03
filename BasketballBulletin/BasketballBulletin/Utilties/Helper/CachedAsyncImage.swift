//
//  CachedAsyncImage.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 02/08/25.
//

import SwiftUI

struct CachedAsyncImage: View {
    let urlString: String
    let placeholder: Image
    let size: CGSize

    @State private var uiImage: UIImage?

    var body: some View {
        Group {
            if let image = uiImage {
                Image(uiImage: image)
                    .resizable()
            } else {
                placeholder
                    .resizable()
                    .onAppear {
                        loadImage()
                    }
            }
        }
        .frame(width: size.width, height: size.height)
    }

    private func loadImage() {
        if let cached = ImageCache.shared.image(forKey: urlString) {
            self.uiImage = cached
            return
        }

        guard let url = URL(string: urlString) else { return }

        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let image = UIImage(data: data) {
                    ImageCache.shared.setImage(image, forKey: urlString)
                    await MainActor.run {
                        self.uiImage = image
                    }
                }
            } catch {
                print("Image loading failed: \(error)")
            }
        }
    }
}
