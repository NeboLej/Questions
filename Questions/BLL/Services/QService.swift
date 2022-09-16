//
//  Service.swift
//  Questions
//
//  Created by Nebo on 08.06.2022.
//

import Foundation
import RxSwift

class QService {
    
    let queue: DispatchQueue
    let bindScheduler: SchedulerType
    let dispBag = DisposeBag()
    
    init(queue: DispatchQueue? = nil) {
        self.queue = queue ?? DispatchQueue( label: "com.service.\(Self.self)" )
        self.bindScheduler = SerialDispatchQueueScheduler( queue: self.queue, internalSerialQueueName: "com.service.\(Self.self)" )
    }
}
