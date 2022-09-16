//
//  TmpRepositoryOffline.swift
//  Questions
//
//  Created by Nebo on 15.09.2022.
//

import Foundation
import RxSwift

class TmpRepositoryOffline: QRepositoryOffline, TmpRepositoryProtocol {
    
    func fechTest() -> Single<String> {
        Single.create { sub in
            sub(.success("BD"))
            return Disposables.create()
        }
    }
}
