//
//  ViewController.swift
//  HWTOSProject2
//
//  Created by Patrick Cooke on 11/6/18.
//  Copyright © 2018 Patrick Cooke. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var result: UIImageView!
    
    var activeCells = [IndexPath]()
    var flashSequence = [IndexPath]()
    var levelCounter = 0
    
    let levels = [
        [6, 7, 8], // 3 lights
        [1, 3, 11, 13], // 4
        [5, 6, 7, 8, 9], // 5
        [0, 4, 5, 9, 10, 14], // 6
        [1, 2, 3, 7, 11, 12, 13], // 7
        [0, 2, 4, 5, 9, 10, 12, 14], // 8
        [1, 2, 3, 6, 7, 8, 11, 12, 13], // 9
        [0, 1, 2, 3, 4, 10, 11, 12, 13, 14], // 10
        [1, 2, 3, 5, 6, 7, 8, 9, 11, 12, 13], // 11
        [0, 1, 3, 4, 5, 6, 8, 9, 10, 11, 13, 14], // 12
        [0, 1, 2, 3, 4, 6, 7, 8, 10, 11, 12, 13, 14], // 13
        [0, 1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14], // 14
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], // 15
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
    }
    
    func createLevel() {
        guard levelCounter < levels.count else { return }
        
        result.alpha = 0
        
        collectionView.visibleCells.forEach { $0.isHidden = true }
        activeCells.removeAll()
        
        for item in levels[levelCounter] {
            let indexPath = IndexPath(item: item, section: 0)
            activeCells.append(indexPath)
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.isHidden = false
        }
        
        activeCells = (activeCells as NSArray).shuffled() as! [IndexPath]
        flashSequence = Array(activeCells.dropFirst())
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createLevel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

