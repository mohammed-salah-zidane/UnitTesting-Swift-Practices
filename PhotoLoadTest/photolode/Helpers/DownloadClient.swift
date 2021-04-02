//
//  DownloadClient.swift
//  photolode
//
//  Created by Caleb Stultz on 1/10/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import Foundation

protocol SessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

class DownloadClient {
    var session: SessionProtocol = URLSession.shared
    
    func downloadImage(withURL url: String) {
        guard let url = URL(string: url) else { fatalError() }
        session.dataTask(with: url) { (data, response, error) in
            //code to create image
        }.resume()
    }
    
    func terribleFunctionYouWouldNeverWrite() {
        let totalValue = 1000000
        var currentValue = 0
        for i in 1...totalValue {
            currentValue = i
        }
    }
}

extension URLSession: SessionProtocol {}
