//
//  ContentView.swift
//  AsyncImage
//
//  Created by Mariam Sikandari on 2023-09-23.
//
import SwiftUI

struct ContentView: View {
    
 @StateObject private var photoListVM = PhotoListViewModel()
    
    var body: some View {
  
        NavigationView {
            List(photoListVM.photos) { photo in
                HStack {
                    URLImage(url: photo.thumbnailUrl)
                    Text(photo.title)
                }
            } .task {
                await photoListVM.populatePhotos()
            }
            .navigationTitle("Photos")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
