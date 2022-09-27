//
//  SimpleValidationViewController.swift
//  RxSwiftPractice
//
//  Created by pineone on 2022/09/27.
//

import UIKit

import RxSwift
import RxCocoa

private let minimalUsernameLength = 5
private let minimalPasswordLength = 10

final class SimpleValidationViewController: BaseViewController {
    
    lazy var usernameLabel = UILabel().then {
        $0.text = "User name"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    lazy var passwordLabel = UILabel().then {
        $0.text = "Password"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    lazy var usernameDescriptionLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = .red
    }
    lazy var passwordDescriptionLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = .red
    }
    lazy var usernameInput = UITextField().then {
        $0.keyboardType = .emailAddress
        $0.borderStyle = .roundedRect
    }
    lazy var passwordInput = UITextField().then {
        $0.keyboardType = .default
        $0.borderStyle = .roundedRect
    }
    lazy var confirmButton = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.backgroundColor = .systemYellow
        $0.isEnabled = false
    }
    lazy var containerView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .equalSpacing
        $0.spacing = 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        bind()
    }
    
    private func setupLayout() {
        view.backgroundColor = .white
        view.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        let subviews = [usernameLabel, usernameInput, usernameDescriptionLabel, passwordLabel, passwordInput, passwordDescriptionLabel, confirmButton]
        subviews.forEach { subView in
            containerView.addArrangedSubview(subView)
        }
    }
    
    private func bind() {
        usernameDescriptionLabel.text = "Username has to be at least \(minimalUsernameLength) characters"
        passwordDescriptionLabel.text = "Password has to be at least \(minimalPasswordLength) characters"
        
        let usernameValid = usernameInput.rx.text.orEmpty
            .map { $0.count >= minimalUsernameLength }
            .share(replay: 1)
        
        let passwordValid = passwordInput.rx.text.orEmpty
            .map { $0.count >= minimalPasswordLength }
            .share(replay: 1)
        
        let everythingValid = Observable.combineLatest(usernameValid, passwordValid) { $0 && $1 }
            .share(replay: 1)
        
        usernameValid
            .bind(to: usernameDescriptionLabel.rx.isHidden)
            .disposed(by: disposeBag)
        
        passwordValid
            .bind(to: passwordDescriptionLabel.rx.isHidden)
            .disposed(by: disposeBag)
        
        everythingValid
            .bind(to: confirmButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        confirmButton.rx.tap
            .subscribe(onNext: { [weak self] _ in self?.showAlert() })
            .disposed(by: disposeBag)
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "RxExaple",
                                      message: "This is wonderful",
                                      preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok",
                               style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
}

