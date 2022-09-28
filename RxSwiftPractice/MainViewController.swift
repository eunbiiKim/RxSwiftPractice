//
//  MainViewController.swift
//  RxSwiftPractice
//
//  Created by pineone on 2022/09/27.
//

import UIKit

import SnapKit

import Then

final class MainViewController: UIViewController {
    
    lazy var tableView = UITableView().then {
        $0.register(MainCell.self, forCellReuseIdentifier: "\(MainCell.self)")
        $0.delegate = self
        $0.dataSource = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.leading.bottom.trailing.equalToSuperview()
        }
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(MainCell.self)", for: indexPath) as! MainCell
        cell.selectionStyle = .none
        switch indexPath.row {
            case 0:
                cell.titleLabel.text = "Adding numbers"
                cell.subtitleLabel.text = "Bindings"
            case 1:
                cell.titleLabel.text = "Simple validation"
                cell.subtitleLabel.text = "Bindings"
            case 2:
                cell.titleLabel.text = "Geolocation Subscription"
                cell.subtitleLabel.text = "Observer, service and Drive example"
            default:
                cell.titleLabel.text = "\(indexPath.row)"
                cell.subtitleLabel.text = "\(indexPath.row)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
            case 0:
                goTo(NumbersViewController() as UIViewController)
            case 1:
                goTo(SimpleValidationViewController() as UIViewController)
            case 2:
                goTo(GeolocationViewController() as UIViewController)
            default:
                goTo(UIViewController())
                
        }
    }
    
    private func goTo(_ viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

