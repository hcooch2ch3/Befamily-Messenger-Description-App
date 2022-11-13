//
//  AppStorePreviewService.swift
//  Befamily-Messenger-Description-App
//
//  Created by 임성민 on 2022/11/12.
//

import Foundation
import Alamofire
import Combine

class AppStorePreviewService {
    func fetchAppStorePreviews() -> AnyPublisher<DataResponse<AppStorePreviews, Error>, Never>? {
        guard let url = URL(string: "https://itunes.apple.com/kr/lookup?id=1502953604") else { return nil }
            
        return AF.request(url, method: .get)
            .validate()
            .publishDecodable(type: AppStorePreviews.self)
            .map { response in
                response.mapError { error in
                    return error
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

