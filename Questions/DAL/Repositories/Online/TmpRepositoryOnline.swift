//
//  TmpRepositoryOnline.swift
//  Questions
//
//  Created by Nebo on 08.06.2022.
//

import Foundation
import RxSwift

class TmpRepositoryOnline: QRepositoryOnline, TmpRepositoryProtocol {
    
    override init(path: String) {
        super.init(path: path)
    }
    
    func fechTest() -> Single<String> {
        RxJSON(path: "id", method: .get , params: ["id": 1], headers: nil).map {
            print($0.asMap())
            return "tmp"
        }
    }
}
