//
//  GeolocationViewController.swift
//  RxSwiftPractice
//
//  Created by pineone on 2022/09/27.
//

import UIKit

import CoreLocation

import RxSwift
import RxCocoa

private extension Reactive where Base: UILabel {
    var coordinates: Binder<CLLocationCoordinate2D> {
        return Binder(base) { label, location in
            label.text = "Lat: \(location.latitude)\nLon: \(location.longitude)"
        }
    }
}

final class GeolocationViewController: BaseViewController {
    
    lazy var label = UILabel().then {
        $0.text = "It seems that\ngeolocation is enabled"
    }
    
    lazy var bottomLabel = UILabel().then {
        $0.text = "You can disable Geolocation on\napp's preferences and come back\nto the app to see what happens"
    }
    
    lazy var openAppButton = UIButton().then {
        $0.setTitle("OPEN APP PREFERENCES", for: .normal)
        $0.layer.cornerRadius = 5
        $0.backgroundColor = .systemBlue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        view.backgroundColor = .white
    }
}
