//
//  PreviewHeader.swift
//  Befamily-Messenger-Description-App
//
//  Created by 임성민 on 2022/11/12.
//

import SwiftUI

struct PreviewHeader: View {
    @ObservedObject var viewModel: AppStorePreviewViewModel
    
    var body: some View {
        HStack {
            if let iconImageURL = viewModel.iconImageURL {
                    CacheAsyncImage(url: iconImageURL) { phase in
                    switch phase {
                    case .success(let iconImage):
                        iconImage
                    default:
                        EmptyView()
                    }
                }
            }
            VStack {
                Text(viewModel.title)
                Text(viewModel.sellerName)
                HStack {
                    Button {
                        print("클릭")
                    } label: {
                        Text("받기")
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    Spacer()
                    Button {
                        print("클릭")
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
        }
    }
}

struct PreviewHeader_Previews: PreviewProvider {
    static var previews: some View {
        PreviewHeader(viewModel: AppStorePreviewViewModel())
    }
}
