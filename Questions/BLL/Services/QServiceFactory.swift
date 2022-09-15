//
//  QServiceFactory.swift
//  Questions
//
//  Created by Nebo on 15.09.2022.
//

import Foundation
import RxSwift

class QServiceFactory: QServiceFactoryProtocol {
    
    private let tmpService: TmpServiceProtocol
    
    init() {
        
        let serviceQueue = DispatchQueue( label: "Model.Queue" )
//        let serviceScheduler = SerialDispatchQueueScheduler( queue: serviceQueue, internalSerialQueueName: "Cache.Queue" )
        
        let tmpRepositoryOnline = TmpRepositoryOnline(path: "questions")
        let tmpRepositoryOffline = TmpRepositoryOffline()
        
        tmpService = TmpService(online: tmpRepositoryOnline, offline: tmpRepositoryOffline, queue: serviceQueue)
    }

    func ProvideTmpService() -> TmpServiceProtocol {
        tmpService
    }
}
