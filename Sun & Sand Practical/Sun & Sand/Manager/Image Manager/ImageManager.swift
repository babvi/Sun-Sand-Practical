//
//  ImageManager.swift
//  Sun & Sand
//
//  Created by Nimit Bagadiya on 18/05/21.
//

import Foundation
import UIKit

class ImageManager {
    
    static let shared = ImageManager()
    
    private func filePath(forKey key: String) -> URL? {
        let fileManager = FileManager.default
        guard let documentURL = fileManager.urls(for: .documentDirectory,
                                                in: FileManager.SearchPathDomainMask.userDomainMask).first else { return nil }
        
        return documentURL.appendingPathComponent(key)
    }
    
    private init() {
        print(filePath(forKey: "")?.absoluteURL ?? "")
    }
    
    /// This will store Data locally
    /// - Parameters:
    ///   - data: <#data description#>
    ///   - key: <#key description#>
    func store(data: Data, forKey key: String) {
        if let filePath = filePath(forKey: key) {
            do{
                try data.write(to: filePath, options: .atomic)
                print("Image saved \(key)")
            }catch let err {
                print("Saving file resulted in error: ", err)
            }
        }
    }
    
    func retrieveImage(forKey key: String) -> UIImage? {
        if let filePath = self.filePath(forKey: key),
            let fileData = FileManager.default.contents(atPath: filePath.path){
            return UIImage(data: fileData)
        }
        return nil
    }
    
}
