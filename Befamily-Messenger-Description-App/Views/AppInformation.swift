//
//  AppInformation.swift
//  Befamily-Messenger-Description-App
//
//  Created by 임성민 on 2022/11/13.
//

import SwiftUI

struct AppInformation: View {
    @ObservedObject var viewModel: AppStorePreviewViewModel
    let titleFont = Font.footnote
    
    var body: some View {
        VStack(spacing: 15) {
            Divider()
            HStack {
                Text("정보")
                    .font(.headline)
                Spacer()
            }
            VStack {
                Divider()
                HStack {
                    Text("제공자")
                        .font(titleFont)
                    Spacer()
                    Text(viewModel.developerName)
                }
            }
            VStack {
                Divider()
                HStack {
                    Text("크기")
                        .font(titleFont)
                    Spacer()
                    Text(viewModel.appSize)
                }
            }
            VStack {
                Divider()
                HStack {
                    Text("카테고리")
                        .font(titleFont)
                    Spacer()
                    Text(viewModel.category)
                }
            }
            VStack {
                Divider()
                HStack {
                    Text("언어")
                        .font(titleFont)
                    Spacer()
                    Text(viewModel.languages)
                }
            }
            VStack {
                Divider()
                HStack {
                    Text("연령 등급")
                        .font(titleFont)
                    Spacer()
                    Text(viewModel.minimumUserAge)
                }
            }
        }
    }
}

struct AppInformation_Previews: PreviewProvider {
    static var previews: some View {
        AppInformation(viewModel: AppStorePreviewViewModel())
    }
}
