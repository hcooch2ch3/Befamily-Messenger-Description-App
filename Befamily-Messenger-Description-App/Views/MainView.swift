//
//  MainView.swift
//  Befamily-Messenger-Description-App
//
//  Created by 임성민 on 2022/11/11.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = AppStorePreviewViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                PreviewHeader(viewModel: viewModel)
                Divider()
                HorizontalSummary(viewModel: viewModel)
                Divider()
                NewFunctionDescription(viewModel: viewModel)
                Divider()
                HorizontalPreviewImage(viewModel: viewModel)
                Divider()
                AppDetailDescription(viewModel: viewModel)
                AppInformation(viewModel: viewModel)
            }
            .padding()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
