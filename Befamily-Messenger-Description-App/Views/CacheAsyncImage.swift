//
//  CacheAsyncImage.swift
//  Befamily-Messenger-Description-App
//
//  Created by 임성민 on 2022/11/13.
//
import SwiftUI
import CoreData

struct CacheAsyncImage: View {
    @StateObject private var viewModel: CacheAsyncImageViewModel
    
    init(url: URL) {
        _viewModel = StateObject(wrappedValue: CacheAsyncImageViewModel(url: url))
    }
    
    var body: some View {
        if let uiImage = viewModel.image {
            Image(uiImage: uiImage)
        }
    }
}

struct CacheAsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        CacheAsyncImage(url: URL(string: "https://is3-ssl.mzstatic.com/image/thumb/Purple112/v4/66/3a/3e/663a3e32-477f-30d5-c810-f39892f3bd31/0b38f5bf-33ab-4525-80be-9cd4b6399600_iPhone5.5_1242x2208_07.png/392x696bb.png")!)
    }
}
