//
//  RemoteImageView.swift
//  HWTOSProject4
//
//  Created by Patrick Cooke on 11/12/18.
//  Copyright © 2018 Patrick Cooke. All rights reserved.
//

import UIKit

class RemoteImageView: UIImageView {

    var url: URL?
    
    func getCachesDirectory() -> URL {
        let paths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func load(_ url: URL) {
        self.url = url
        
        guard let savedFilename = url.absoluteString.addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics) else { return }
        let fullPath = getCachesDirectory().appendingPathComponent(savedFilename)
        
        if FileManager.default.fileExists(atPath: fullPath.path) {
            image = UIImage(contentsOfFile: fullPath.path)
            return
        }
        DispatchQueue.global(qos: .userInitiated).async {
            guard let imageData = try? Data(contentsOf: url) else { return }
            try? imageData.write(to: fullPath)
            
            if self.url == url {
                DispatchQueue.main.async {
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }

}
