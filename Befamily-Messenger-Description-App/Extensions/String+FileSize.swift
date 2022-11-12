//
//  String+FileSize.swift
//  Befamily-Messenger-Description-App
//
//  Created by 임성민 on 2022/11/13.
//

import Foundation

extension String {
    var fileSize: String {
        guard let size = Double(self) else { return "" }
        let mbSize = size / (1024*1024)
        let kbSize = size / (1024)
        var result = ""
        if mbSize < 1 {
            result += String(format: "%.1f", kbSize) + "KB"
        } else {
            result += String(format: "%.1f", mbSize) + "MB"
        }
        return result
    }
}
