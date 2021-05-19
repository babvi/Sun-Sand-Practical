//
//  UIImageView+Extensions.swift
//  Sun & Sand
//
//  Created by Nimit Bagadiya on 18/05/21.
//

import Foundation
import UIKit

extension UIImageView {
    
    func downloadImage(with stringUrl: String, placeholder: String) {
        self.image = nil
        guard let url = URL(string: stringUrl) else {
            return
        }
        self.image = UIImage(named: placeholder)
        let path = stringUrl.replacingOccurrences(of: "/", with: "_")
        
        /// This will check Whether image was downloaded and saved earlier, if yes then it will return image
        if let image = ImageManager.shared.retrieveImage(forKey: path) {
            self.image = image
            return
        }
        
        let session = URLSession.shared.dataTask(with: url) { (data,_,_) in
            if let data = data {
                ImageManager.shared.store(data: data, forKey: path)
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
                return
            }
            self.image = UIImage(named: placeholder)
        }
        session.resume()
    }
    
}
