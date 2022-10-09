//
//  QBindUIProtocol.swift
//  Questions
//
//  Created by Nebo on 16.09.2022.
//

import UIKit
import RxSwift
import RxCocoa


protocol QBindUIProtocol {
    associatedtype ViewModel: QBaseViewModel
    var viewModel: ViewModel! { get }
    var dispBag: DisposeBag { get }
    var bindScheduler: SchedulerType { get }
}

extension QBindUIProtocol where Self: UIViewController {
    
    func bindQ<O: ObservableType>(from: O, map: @escaping (O.Element) -> String, to: UILabel ) {
        from
            .map{ map($0) }
            .distinctUntilChanged()
            .bind(to: to.rx.text)
            .disposed(by: dispBag)
    }
    
    func bindHidden<O: ObservableType>(from: O, map: @escaping (O.Element) -> Bool, to: UIView, duration: TimeInterval = 0) {
        from
            .map { map($0) }
            .distinctUntilChanged()
            .observe( on: bindScheduler )
            .bind { isHidden in
                UIView.animate(withDuration: duration) {
                    to.alpha = isHidden ? 0.0 : 1.0
                } completion: { _ in
                    to.isHidden = isHidden
                }
            }
            .disposed( by: dispBag )
    }
}
