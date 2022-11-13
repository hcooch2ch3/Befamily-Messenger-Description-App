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
                CacheAsyncImage(url: iconImageURL)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.gray, lineWidth: 1)
                    )
            }
            VStack(alignment: .leading) {
                Text(viewModel.title)
                    .font(.headline)
                Text(viewModel.sellerName)
                    .font(.subheadline)
                HStack {
                    Button {} label: {
                        Text("받기")
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    Spacer()
                    Button {} label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
            .padding(.leading, 10)
            .padding(.trailing, 20)
        }
        .padding(.bottom, 10)
    }
}

struct PreviewHeader_Previews: PreviewProvider {
    static var previews: some View {
        PreviewHeader(viewModel: AppStorePreviewViewModel())
    }
}
