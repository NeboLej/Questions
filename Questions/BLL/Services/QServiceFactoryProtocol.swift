//
//  QServiceFactoryProtocol.swift
//  Questions
//
//  Created by Nebo on 15.09.2022.
//

import Foundation

protocol QServiceFactoryProtocol {
    
    func ProvideTmpService() -> TmpServiceProtocol
    
}
