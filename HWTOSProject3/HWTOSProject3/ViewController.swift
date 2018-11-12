//
//  ViewController.swift
//  HWTOSProject3
//
//  Created by Patrick Cooke on 11/12/18.
//  Copyright © 2018 Patrick Cooke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var textFieldTip: UILabel!
    @IBOutlet var nextButton: UIButton!
    var focusGuide: UIFocusGuide!
    
    @IBAction func showAlert(_ sender: Any) {
        let ac = UIAlertController(title: "Hello", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(ac, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        focusGuide = UIFocusGuide()
        view.addLayoutGuide(focusGuide)
        focusGuide.topAnchor.constraint(equalTo: textField.bottomAnchor).isActive = true
        focusGuide.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        focusGuide.heightAnchor.constraint(equalToConstant: 1).isActive = true
        focusGuide.preferredFocusEnvironments = [nextButton]
        restoresFocusAfterTransition = false
    }

    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        if context.nextFocusedView == textField {
            focusGuide.preferredFocusEnvironments = [nextButton]
        } else if context.nextFocusedView == nextButton {
            focusGuide.preferredFocusEnvironments = [textField]
        }
        
        if context.nextFocusedView == textField {
            coordinator.addCoordinatedAnimations({
                self.textFieldTip.alpha = 1
            })
        } else if context.previouslyFocusedView == textField {
            coordinator.addCoordinatedAnimations({
                self.textFieldTip.alpha = 0
            })
        }
//        if let focusedView = UIScreen.main.focusedView {
//            print(focusedView)
//        }
    }
    
    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        return [textField]
    }
}
