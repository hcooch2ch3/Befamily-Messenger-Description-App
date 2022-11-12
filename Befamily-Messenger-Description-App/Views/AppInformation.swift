//
//  AppInformation.swift
//  Befamily-Messenger-Description-App
//
//  Created by 임성민 on 2022/11/13.
//

import SwiftUI

struct AppInformation: View {
    @ObservedObject var viewModel: AppStorePreviewViewModel
    
    var body: some View {
        VStack {
            Divider()
            HStack {
                Text("정보")
                Spacer()
            }
            HStack {
                Text("제공자")
                Spacer()
                Text(viewModel.developerName)
            }
            HStack {
                Text("크기")
                Spacer()
                Text(viewModel.appSize)
            }
            HStack {
                Text("카테고리")
                Spacer()
                Text(viewModel.category)
            }
            HStack {
                Text("언어")
                Spacer()
                Text(viewModel.languages)
            }
            HStack {
                Text("연령 등급")
                Spacer()
                Text(viewModel.minimumUserAge)
            }
        }
    }
}

struct AppInformation_Previews: PreviewProvider {
    static var previews: some View {
        AppInformation(viewModel: AppStorePreviewViewModel())
    }
}
