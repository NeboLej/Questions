//
//  TmpService.swift
//  Questions
//
//  Created by Nebo on 15.09.2022.
//

import Foundation
import RxSwift

class TmpService: QService, TmpServiceProtocol {

    let online: TmpRepositoryProtocol
    let offline: TmpRepositoryProtocol
    var isConnect = true
     
    init(online: TmpRepositoryProtocol, offline: TmpRepositoryProtocol, queue: DispatchQueue? = nil) {
        self.online = online
        self.offline = offline
        
        super.init(queue: queue)
    }
    
    func rxTmpFunc() -> Single<String> {
        return isConnect ? online.fechTest() : offline.fechTest()
    }
}
