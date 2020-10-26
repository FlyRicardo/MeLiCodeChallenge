//
//  UIImageView+downloadImageHandler.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 22/10/20.
//  Copyright © 2020 Fabián Ricardo Rodríguez Avellaneda. All rights reserved.
//

import UIKit

protocol Cachable {}

// ImageCache private instance
private  let imageCache = NSCache<NSString, UIImage>()

extension UIImageView: Cachable {}

//Protocol extension to add optional function implementations
extension Cachable where Self: UIImageView {
    
    typealias SuccessCompletion = (Bool) -> ()
    func loadImageUsingCacheWithURLString(_ urlString: String, placeHolder: UIImage?, completion: @escaping SuccessCompletion) {
        
        self.image = nil
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            DispatchQueue.main.async {
                self.image = cachedImage
                completion(true)
            }
            return
        }
        self.image = placeHolder
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    return
                }
                if httpResponse.statusCode == 200{
                    if let _data = data, let downloadedImage = UIImage(data: _data){
                        imageCache.setObject(downloadedImage, forKey: NSString(string: urlString))
                        DispatchQueue.main.async {
                            self.image = downloadedImage
                            completion(true)
                        }
                    }
                } else {
                    self.image = placeHolder
                }
            }).resume()
        } else {
            self.image = placeHolder
        }
    }
}
