//
//  TextField.swift
//  LoginScreen
//
//  Created by Veronika Zelinkova on 29.03.2022.
//

import UIKit

class TextField: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
}

// MARK: - Private Methods
private extension TextField {
    func setupUI() {
        textColor = .appText
        keyboardAppearance = .dark
    }
}
