//
//  CacheAsyncImageViewModel.swift
//  Befamily-Messenger-Description-App
//
//  Created by 임성민 on 2022/11/13.
//

import Foundation
import UIKit
import CoreData

class CacheAsyncImageViewModel: ObservableObject {
    @Published var image: UIImage?
    
    init(url: URL) {
        if let image = ImageCache.cache[url] {
            self.image = image
        } else {
            URLSession.shared.dataTask(with: url) { data, _, error in
               guard let data = data, error == nil else {
                   return
               }
                
                let image = UIImage(data: data)
                let imageFile = ImageFile(context: CoreDataManager.shared.persistentContainer.viewContext)
                imageFile.url = url.absoluteString
                imageFile.content = image
                try? CoreDataManager.shared.persistentContainer.viewContext.save()
                
                ImageCache.cache[url] = image
                
                DispatchQueue.main.async {
                   self.image = image
                }
           }.resume()
        }
    }
}

class ImageCache {
    static private func getDiskCache() -> [URL: UIImage] {
        var diskCaches: [URL: UIImage] = [:]
        let request: NSFetchRequest<ImageFile> = NSFetchRequest(entityName: "ImageFile")
                do {
                    let imageFiles: [ImageFile] = try CoreDataManager.shared.persistentContainer.viewContext.fetch(request)
                    for imageFile in imageFiles {
                        if let urlStrig = imageFile.url,
                           let url = URL(string: urlStrig),
                           let uiImage = imageFile.content {
                            diskCaches[url] = uiImage
                        }
                    }
                } catch {
                    print(error)
                }
        return diskCaches
    }
    
    static var cache: [URL: UIImage] = getDiskCache()
    
    static subscript(url: URL) -> UIImage? {
        get {
            ImageCache.cache[url]
        }
        set {
            ImageCache.cache[url] = newValue
        }
    }
}
    
