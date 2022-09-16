//
//  TmpServiceProtocol.swift
//  Questions
//
//  Created by Nebo on 15.09.2022.
//

import Foundation
import RxSwift

protocol TmpServiceProtocol {
    
    func rxTmpFunc() -> Single<String>
}
