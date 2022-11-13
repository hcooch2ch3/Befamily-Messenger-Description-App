//
//  NewFunctionDescription.swift
//  Befamily-Messenger-Description-App
//
//  Created by 임성민 on 2022/11/12.
//

import SwiftUI

struct NewFunctionDescription: View {
    @ObservedObject var viewModel: AppStorePreviewViewModel
    @State var lineLimit: Int? = 3
    
    var body: some View {
        VStack(spacing: 5) {
            HStack {
                Text("새로운 기능")
                    .font(.headline)
                Spacer()
                Button {} label: {
                    Text("버전 기록")
                }
            }
            HStack {
                Text("버전 \(viewModel.version)")
                Spacer()
                Text(viewModel.versionDate)
            }
            .font(.footnote)
            HStack(alignment: .bottom) {
                Text(viewModel.versionDescription)
                    .lineLimit(lineLimit)
                if lineLimit == 3 {
                    Spacer()
                    Button {
                        lineLimit = nil
                    } label: {
                        Text("더 보기")
                            .font(.footnote)
                    }
                }
            }
            .font(.body)
        }
    }
}

struct NewFunctionDescription_Previews: PreviewProvider {
    static var previews: some View {
        NewFunctionDescription(viewModel: AppStorePreviewViewModel())
    }
}
