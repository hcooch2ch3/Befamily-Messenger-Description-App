//
//  HorizontalSummary.swift
//  Befamily-Messenger-Description-App
//
//  Created by 임성민 on 2022/11/12.
//

import SwiftUI

struct HorizontalSummary: View {
    @ObservedObject var viewModel: AppStorePreviewViewModel
    let vStackSpacing: CGFloat = 5
    let titleFont = Font.footnote
    let contentFont = Font.subheadline
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                VStack(spacing: vStackSpacing) {
                    Text("\(viewModel.userRatingCount)개의 평가")
                        .font(titleFont)
                    Text(viewModel.averageUserRating)
                        .font(contentFont)
                }
                .padding(.leading, 20)
                Divider()
                VStack(spacing: vStackSpacing) {
                    Text("연령")
                        .font(titleFont)
                    Text(viewModel.minimumUserAge)
                        .font(contentFont)
                }
                Divider()
                VStack(spacing: vStackSpacing) {
                    Text("카테고리")
                        .font(titleFont)
                    Text(viewModel.category)
                        .font(contentFont)
                }
                Divider()
                VStack(spacing: vStackSpacing) {
                    Text("개발자")
                        .font(titleFont)
                    Text(viewModel.developerName)
                        .font(contentFont)
                }
                Divider()
                VStack(spacing: vStackSpacing) {
                    Text("언어")
                        .font(titleFont)
                    Text(viewModel.language)
                        .font(contentFont)
                    if viewModel.moreLanguageCount > 0 {
                        Text("+ \(viewModel.moreLanguageCount)개 언어")
                            .font(titleFont)
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
