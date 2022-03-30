//
//  LoginViewController.swift
//  LoginScreen
//
//  Created by Veronika Zelinkova on 29.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - Constants
    private let doneButtonBottomPaddingKeyboardUp: CGFloat = 15
    private let doneButtonBottomPaddingKeyboardDown: CGFloat = 47

    // MARK: - IBOutlets
    @IBOutlet private var emailTextField: TextField!
    @IBOutlet private var passwordTextField: TextField!
    @IBOutlet private var doneBottomButtonConstraint: NSLayoutConstraint!
    @IBOutlet private var doneButton: DoneButton!
    @IBOutlet private var revealPasswordButton: RevealButton!

    // MARK: - Private Properties
    private var email: String {
        return emailTextField.text ?? ""
    }

    private var password: String {
        return passwordTextField.text ?? ""
    }

    private var isFormValid: Bool {
        return isEmailValid && isPasswordValid
    }

    private var isEmailValid: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return email.range(of: emailRegEx, options: .regularExpression, range: nil, locale: nil) != nil
    }

    private var isPasswordValid: Bool {
        return !password.isEmpty
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

// MARK: - IBActions
private extension LoginViewController {
    @IBAction func didPressRevealButton(_: Any) {
        passwordTextField.isSecureTextEntry.toggle()
        revealPasswordButton.setState(passwordTextField.isSecureTextEntry ? .show : .hide)
    }
}

// MARK: - Private Methods
private extension LoginViewController {
    func setupUI() {
        let placeholderAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.appText!
        ] as [NSAttributedString.Key: Any]
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: placeholderAttributes)
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: placeholderAttributes)

        emailTextField.delegate = self
        passwordTextField.delegate = self

        emailTextField.returnKeyType = .next
        passwordTextField.returnKeyType = .done

        passwordTextField.isSecureTextEntry = true

        emailTextField.addTarget(
            self,
            action: #selector(didChangeInput),
            for: .editingChanged
        )
        passwordTextField.addTarget(
            self,
            action: #selector(didChangeInput),
            for: .editingChanged
        )

        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapOnView))
        view.addGestureRecognizer(tap)

        registerKeyboardListeners()
        
        doneButton.isEnabled = false
        revealPasswordButton.isHidden = true
        revealPasswordButton.setState(.show)
    }
    
    @objc func didTapOnView() {
        view.endEditing(true)
    }

    func registerKeyboardListeners() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(notification: Notification) {
        guard let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        doneBottomButtonConstraint.constant = keyboardSize.height + doneButtonBottomPaddingKeyboardUp - view.safeAreaInsets.bottom
        view.layoutIfNeeded()
    }

    @objc func keyboardWillHide() {
        doneBottomButtonConstraint.constant = doneButtonBottomPaddingKeyboardDown
        view.layoutIfNeeded()
    }

    @objc func didChangeInput() {
        revealPasswordButton.isHidden = password.isEmpty
        doneButton.isEnabled = isFormValid
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            passwordTextField.resignFirstResponder()
        }
        return true
    }
}
