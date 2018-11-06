//
//  ImagesViewController.swift
//  HWTVOSProject1
//
//  Created by Patrick Cooke on 11/4/18.
//  Copyright © 2018 Patrick Cooke. All rights reserved.
//

import UIKit

class ImagesViewController: UIViewController {

    @IBOutlet var spinner: UIActivityIndicatorView!
    @IBOutlet var creditLabel: UILabel!
    var appID = "72ee628d37fc81396e1eb4dda2a3fbe2d3fd7b9c5f418868fb467939710d63fc"
    var category = ""
    var imageViews = [UIImageView]()
    var images = [JSON]()
    var imageCounter = 0
    var shouldContinue = true
    
    func fetch(_ url: URL) {
        if let data = try? Data(contentsOf: url) {
            let json = JSON(data)
            images = json["results"].arrayValue
            downloadImage()
        }
    }
    
    func downloadImage() {
        if shouldContinue {
            let currentImage = images[imageCounter % images.count]
            
            let imageName = currentImage["urls"]["full"].stringValue
            let imageCredit = currentImage["user"]["name"].stringValue
            
            imageCounter += 1
            
            guard let imageURL = URL(string: imageName) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            guard let image = UIImage(data: imageData) else { return }
            DispatchQueue.main.async {
                self.show(image, credit: imageCredit)
            }
        }
    }
    
    func show(_ image: UIImage, credit: String) {
        spinner.stopAnimating()
        
        let imageViewToUse = imageViews[imageCounter % imageViews.count]
        let otherImageView = imageViews[(imageCounter + 1) % imageViews.count]
        
        UIView.animate(withDuration: 2.0, animations: {
            imageViewToUse.image = image
            imageViewToUse.alpha = 1
            self.creditLabel.alpha = 0
            
            self.view.sendSubviewToBack(otherImageView)
        }) { _ in
            self.creditLabel.text = "  \(credit.uppercased())"
            self.creditLabel.alpha = 1
            otherImageView.alpha = 0
            otherImageView.transform = .identity
            UIView.animate(withDuration: 10.0, animations: {
                imageViewToUse.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            }, completion: { _ in
                DispatchQueue.global(qos: .userInteractive).async {
                    self.downloadImage()
                }
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViews = view.subviews.compactMap { $0 as? UIImageView }
        imageViews.forEach { $0.alpha = 0 }
        creditLabel.layer.cornerRadius = 15
        
        guard let url = URL(string: "https://api.unsplash.com/search/photos?client_id=\(appID)&query=\(category)&per_page=100") else { return }
        DispatchQueue.global(qos: .userInteractive).async {
            self.fetch(url)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        shouldContinue = false
    }

}
