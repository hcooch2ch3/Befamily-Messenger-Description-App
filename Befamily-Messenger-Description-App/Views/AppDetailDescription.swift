//
//  AppDetailDescription.swift
//  Befamily-Messenger-Description-App
//
//  Created by 임성민 on 2022/11/12.
//

import SwiftUI

struct AppDetailDescription: View {
    @ObservedObject var viewModel = AppStorePreviewViewModel()
    @State var lineLimit: Int? = 3
    
    var body: some View {
        HStack(alignment: .bottom) {
            Text(viewModel.appDescription)
                .lineLimit(lineLimit)
            if lineLimit == 3 {
                Spacer()
                Button {
                    lineLimit = nil
                } label: {
                    Text("더 보기")
                }
            }
        }
    }
}

struct AppDetailDescription_Previews: PreviewProvider {
    static var previews: some View {
        AppDetailDescription()
    }
}
