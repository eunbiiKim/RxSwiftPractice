//
//  NumbersViewController.swift
//  RxSwiftPractice
//
//  Created by pineone on 2022/09/27.
//

import RxSwift

final class NumbersViewController: BaseViewController {
    
    var result: Observable<Int> = Observable<Int>.just(0)
    
    lazy var textField1 = UITextField().then {
        $0.keyboardType = .decimalPad
        $0.borderStyle = .roundedRect
        $0.textAlignment = .right
    }
    lazy var textField2 = UITextField().then {
        $0.keyboardType = .decimalPad
        $0.borderStyle = .roundedRect
        $0.textAlignment = .right
    }
    lazy var textField3 = UITextField().then {
        $0.keyboardType = .decimalPad
        $0.borderStyle = .roundedRect
        $0.textAlignment = .right
    }
    lazy var resultLabel = UILabel().then {
        $0.textAlignment = .right
        $0.text = "8"
    }
    lazy var containerView = UIStackView().then {
        $0.backgroundColor = .systemGroupedBackground
        $0.distribution = .equalSpacing
        $0.alignment = .fill
        $0.axis = .vertical
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
        containerView.addArrangedSubview(textField1)
        containerView.addArrangedSubview(textField2)
        containerView.addArrangedSubview(textField3)
        containerView.addArrangedSubview(resultLabel)
        
        containerView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(200)
        }
    }
    
    private func bind() {
        Observable.combineLatest(textField1.rx.text.orEmpty,
                                 textField2.rx.text.orEmpty,
                                 textField3.rx.text.orEmpty)
        { textValue1, textValue2, textValue3 -> Int in
            return (Int(textValue1) ?? 0) + (Int(textValue2) ?? 0) + (Int(textValue3) ?? 0)
        }
        .map { "\($0)" }
        .bind(to: self.resultLabel.rx.text)
        .disposed(by: self.disposeBag)
    }
}
