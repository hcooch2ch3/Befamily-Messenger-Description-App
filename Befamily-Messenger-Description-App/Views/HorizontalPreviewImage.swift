//
//  HorizontalPreviewImage.swift
//  Befamily-Messenger-Description-App
//
//  Created by 임성민 on 2022/11/12.
//

import SwiftUI

struct HorizontalPreviewImage: View {
    @ObservedObject var viewModel: AppStorePreviewViewModel
    @State var imageCount = 1
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    if imageCount < viewModel.previewImageURLs.count {
                        imageCount += 1
                    }
                } label: {
                    Text("미리보기")
                }
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader { proxy in
                    HStack {
                        ForEach(0..<imageCount, id: \.self) {
                            if $0 < viewModel.previewImageURLs.count {
                                let imageURL = viewModel.previewImageURLs[$0]
                                CacheAsyncImage(url: imageURL) { phase in
                                    switch phase {
                                    case .success(let previewImage):
                                        previewImage
                                            .onAppear {
                                                withAnimation {
                                                    proxy.scrollTo(imageCount-1, anchor: .leading)
                                                }
                                            }
                                    default:
                                        EmptyView()
                                    }
                                }
                                .id($0)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct HorizontalPreviewImage_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalPreviewImage(viewModel: AppStorePreviewViewModel())
    }
}
