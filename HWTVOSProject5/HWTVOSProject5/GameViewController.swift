//
//  GameViewController.swift
//  HWTVOSProject5
//
//  Created by Patrick Cooke on 11/18/18.
//  Copyright © 2018 Patrick Cooke. All rights reserved.
//

import UIKit

class GameViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
    }

}
