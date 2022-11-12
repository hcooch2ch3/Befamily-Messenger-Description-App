//
//  HorizontalSummary.swift
//  Befamily-Messenger-Description-App
//
//  Created by 임성민 on 2022/11/12.
//

import SwiftUI

struct HorizontalSummary: View {
    @ObservedObject var viewModel: AppStorePreviewViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                VStack {
                    Text("\(viewModel.userRatingCount)개의 평가")
                    Text("\(viewModel.averageUserRating)")
                }
                VStack {
                    Text("연령")
                    Text("\(viewModel.minimumUserAge)")
                }
                VStack {
                    Text("카테고리")
                    Text("\(viewModel.category)")
                }
                VStack {
                    Text("개발자")
                    Text("\(viewModel.developerName)")
                }
                VStack {
                    Text("언어")
                    Text("\(viewModel.language)")
                    if viewModel.moreLanguageCount > 0 {
                        Text("+ \(viewModel.moreLanguageCount)개 언어")
                    }
                }
            }
        }
    }
}

struct HorizontalSummary_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalSummary(viewModel: AppStorePreviewViewModel())
    }
}
