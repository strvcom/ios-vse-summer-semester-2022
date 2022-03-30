//
//  DoneButton.swift
//  LoginScreen
//
//  Created by Veronika Zelinkova on 29.03.2022.
//

import UIKit

class DoneButton: UIButton {
    private let cornerRadius: CGFloat = 3
    
    override var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled ? .appAction : .appButtonBackground
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
}

private extension DoneButton {
    func setupUI() {
        layer.cornerRadius = cornerRadius
    }
}
