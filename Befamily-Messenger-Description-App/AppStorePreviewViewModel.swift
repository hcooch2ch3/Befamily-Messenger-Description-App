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
    
    init() {
        getAppStorePreviews()
    }
    
    func getAppStorePreviews() {
        appStorePreviewService.fetchAppStorePreviews()?.sink { (dataResponse) in
            if dataResponse.error != nil {
                debugPrint(dataResponse.error!)
            } else {
                self.appStorePreviews = dataResponse.value
                print(self.appStorePreviews)
            }
        }.store(in: &cancellableSet)
    }
}
