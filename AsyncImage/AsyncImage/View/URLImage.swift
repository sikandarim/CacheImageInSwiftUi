//
//  URLImage.swift
//  AsyncImage
//
//  Created by Mariam Sikandari on 2023-09-23.
//

import Foundation
import SwiftUI

struct URLImage : View {
    
    let url: URL?
    @StateObject private var imageLoader = ImageLoader()
    
    var body: some View {
        
        VStack {
            if let uiImage = imageLoader.uiImage {
                Image(uiImage: uiImage)
            } else {
                ProgressView("Loading...")
            }
        } .task {
            await downloadImage()
        }
        
        
        
        Text("URLImage")
    }
    
    private func downloadImage() async {
        do {
            try await imageLoader.fetchImage(url)
        } catch {
            print(error)
        }
    }
    
    
    
    
    
    
    
    
    
}
