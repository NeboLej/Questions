//
//  QBaseViewModel.swift
//  Questions
//
//  Created by Nebo on 12.06.2022.
//

import Foundation
import RxRelay
import RxSwift

class QBaseViewModel {
    
    public let bindScheduler: SchedulerType = MainScheduler.asyncInstance
    
    func checkExistFile(url: String) -> URL? {
        if url.isEmpty { return nil }
        
        var docPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
        docPath.appendPathComponent(url.urlPath)
        docPath.appendPathComponent(url.lastURLComponent)
        
        if FileManager.default.fileExists(atPath: docPath.path) {
            return docPath
        }
        
        return nil
    }
}
