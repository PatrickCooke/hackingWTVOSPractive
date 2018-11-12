//
//  apiKey.swift
//  HWTOSProject4
//
//  Created by Patrick Cooke on 11/12/18.
//  Copyright © 2018 Patrick Cooke. All rights reserved.
//

import UIKit

class APIKey: NSObject {
    
    static let shared = APIKey(guardianKey: "This will be the key")
    
    public var guardianKey: String
    
    private init(guardianKey: String) {
        self.guardianKey = guardianKey
    }
}
