//
//  GeolocationService.swift
//  RxSwiftPractice
//
//  Created by pineone on 2022/09/28.
//

import CoreLocation
import RxSwift
import RxCocoa

class GeolocationService {
    
//    // GeolocationService를 싱글톤으로 사용하기 위한 타입 프로퍼티
//    static let instance = GeolocationService()
//
//    private (set) var authorized: Driver<Bool> //
//
//    private (set) var location: Driver<CLLocationCoordinate2D>
//
//    private let locationManager = CLLocationManager()
//
//    private init() {
//        // 거리 필터 설정 - kCLDistanceFilterNone은  distanceFilter 속성을 취소하는 속성
//        locationManager.distanceFilter = kCLDistanceFilterNone
//
//        // 위치정확도 설정
//        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
//
//        authorized = Observable.deferred { [weak locationManager] in
//
//            let status = CLLocationManager.authorizationStatus()
//
//            guard let locationManager = locationManager else {
//                return Observable.just(status)
//            }
////            return locationManager.rx.location.startWith(status)
//        }
//        .asDriver(onErrorJustReturn: CLAuthorizationStatus.notDetermined)
//        .map {
//            switch $0 {
//                case .authorizedAlways:
//                    return true
//                case .authorizedWhenInUse:
//                    return true
//                default:
//                    return false
//            }
//        }
//
//    }
}
