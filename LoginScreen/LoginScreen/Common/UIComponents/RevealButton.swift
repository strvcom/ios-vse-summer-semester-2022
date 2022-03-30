//
//  RevealButton.swift
//  LoginScreen
//
//  Created by Veronika Zelinkova on 29.03.2022.
//

import UIKit

class RevealButton: UIButton {
    enum RevealState {
        case show
        case hide
    }

    func setState(_ state: RevealState) {
        let attr: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.appText!
        ]
        
        let title: String = {
            switch state {
            case .show: return "Show"
            case .hide: return "Hide"
            }
        }()
        
        let attrTitle = NSAttributedString(string: title.uppercased(), attributes: attr)
        setAttributedTitle(attrTitle, for: .normal)
    }
}
