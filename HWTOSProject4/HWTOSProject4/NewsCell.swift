//
//  NewsCell.swift
//  HWTOSProject4
//
//  Created by Patrick Cooke on 11/12/18.
//  Copyright © 2018 Patrick Cooke. All rights reserved.
//

import UIKit

class NewsCell: UICollectionViewCell {
    @IBOutlet var imageView: RemoteImageView!
    @IBOutlet var textLabel: UILabel!
    
    @IBOutlet var unfocusedConstraint: NSLayoutConstraint!
    var focusedConstraint: NSLayoutConstraint!

    
    override func awakeFromNib() {
        focusedConstraint = textLabel.topAnchor.constraint(equalTo: imageView.focusedFrameGuide.bottomAnchor, constant: 15)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        focusedConstraint.isActive = isFocused
        unfocusedConstraint.isActive = !isFocused
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        setNeedsUpdateConstraints()
        
        coordinator.addCoordinatedAnimations({
            self.layoutIfNeeded()
        })
    }
    
}
