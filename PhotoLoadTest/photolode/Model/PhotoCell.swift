//
//  PhotoCell.swift
//  photolode
//
//  Created by Caleb Stultz on 1/5/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import UIKit

var imageCache: NSCache<AnyObject, AnyObject> = NSCache()

class PhotoCell: UITableViewCell {
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    func downloadImage(withUrlString urlString: String) {
        spinner.activityIndicatorViewStyle = .whiteLarge
        spinner.hidesWhenStopped = true
        spinner.startAnimating()

        let url = URL(string: urlString)!
        
        if let imageFromCache = imageCache.object(forKey: url.absoluteString as AnyObject) as? UIImage {
            self.photoImageView.image = imageFromCache
            self.spinner.stopAnimating()
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if error != nil {
                debugPrint(String(describing: error?.localizedDescription))
                return
            }
            
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data!)
                self.photoImageView.image = imageToCache
                self.spinner.stopAnimating()
                imageCache.setObject(imageToCache!, forKey: url.absoluteString as AnyObject)
            }
        }).resume()
    }
}
