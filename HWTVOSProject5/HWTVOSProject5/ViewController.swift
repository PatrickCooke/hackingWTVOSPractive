//
//  ViewController.swift
//  HWTVOSProject5
//
//  Created by Patrick Cooke on 11/18/18.
//  Copyright © 2018 Patrick Cooke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var language: UISegmentedControl!
    @IBOutlet var words: UISegmentedControl!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? GameViewController else { return }
        vc.targetLanguage = language.titleForSegment(at: language.selectedSegmentIndex)!.lowercased()
        vc.wordType = words.titleForSegment(at: words.selectedSegmentIndex)!.lowercased()
    }
}
