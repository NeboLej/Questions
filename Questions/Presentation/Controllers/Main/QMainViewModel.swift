//
//  QMainViewModel.swift
//  Questions
//
//  Created by Nebo on 17.06.2022.
//

import Foundation
import RxSwift
import RxRelay

class QMainViewModel: QBaseViewModel {
    
    let tmpService: TmpServiceProtocol
    let rxString = BehaviorRelay(value: "")
    let dispBag = DisposeBag()
    
    init(serviceFactory: QServiceFactoryProtocol) {
        tmpService = serviceFactory.ProvideTmpService()
        super.init()
        
        _ = tmpService.rxTmpFunc().subscribe(onSuccess: { rr in
            print(rr)
        }, onFailure: { error in
            print(error)
        }).disposed(by: dispBag)
    }
    
    
}
