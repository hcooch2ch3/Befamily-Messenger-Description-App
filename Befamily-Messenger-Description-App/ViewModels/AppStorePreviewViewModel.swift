//
//  AppStorePreviewViewModel.swift
//  Befamily-Messenger-Description-App
//
//  Created by 임성민 on 2022/11/12.
//

import Foundation
import Combine

class AppStorePreviewViewModel: ObservableObject {
    private var appStorePreviewService = AppStorePreviewService()
    private var cancellableSet: Set<AnyCancellable> = []
    
    @Published var appStorePreviews: AppStorePreviews?
    @Published var iconImageURL: URL?
    @Published var title: String = "앱 이름"
    @Published var sellerName: String = "판매자명"
    @Published var userRatingCount: Int = 0
    @Published var averageUserRating: String = "0.0"
    @Published var minimumUserAge: String = "0+"
    @Published var category: String = "카테고리"
    @Published var developerName: String = "개발자"
    @Published var language: String = "언어"
    @Published var moreLanguageCount: Int = 0
    @Published var version: String = "0.0.0"
    @Published var versionDate: String = "0일 전"
    @Published var versionDescription: String = "버전 상세 설명"
    @Published var appDescription: String = "앱 상세 설명"
    @Published var previewImageURLs: [URL] = []
    @Published var appSize: String = "0"
    @Published var languages: String = ""
    
    init() {
        getAppStorePreviews()
    }
    
    func getAppStorePreviews() {
        appStorePreviewService.fetchAppStorePreviews()?.sink { (dataResponse) in
            if let error = dataResponse.error {
                debugPrint(error)
                return
            }
            self.appStorePreviews = dataResponse.value
            self.setProperties()
        }.store(in: &cancellableSet)
    }
    
    private func setProperties() {
        guard let appStorePreviews = self.appStorePreviews,
              appStorePreviews.resultCount > 0,
              let appStorePreview = appStorePreviews.results.first else { return }
        
        self.title = appStorePreview.trackName
        self.sellerName = appStorePreview.sellerName
        self.userRatingCount = appStorePreview.userRatingCount
        self.averageUserRating = String(format: "%.1f", appStorePreview.averageUserRating)
        self.minimumUserAge = appStorePreview.contentAdvisoryRating
        self.category = appStorePreview.genres.first ?? "알 수 없음"
        self.developerName = appStorePreview.artistName
        self.language = appStorePreview.languageCodesISO2A.first ?? "언어"
        self.moreLanguageCount = appStorePreview.languageCodesISO2A.count - 1
        self.version = appStorePreview.version
        self.versionDate = appStorePreview.currentVersionReleaseDate.relativeDateTimeString
        self.versionDescription = appStorePreview.releaseNotes
        self.appDescription = appStorePreview.resultDescription
        self.iconImageURL = URL(string: appStorePreview.artworkUrl100)
        self.previewImageURLs = appStorePreview.screenshotUrls.compactMap { URL(string: $0) }
        self.appSize = appStorePreview.fileSizeBytes.fileSize
        self.languages = appStorePreview.languageCodesISO2A.map {
            switch $0 {
            case "EN": return "영어"
            case "KO": return "한국어"
            default: return "알 수 없음"
            }
        }.joined(separator: ", ")
    }
}
