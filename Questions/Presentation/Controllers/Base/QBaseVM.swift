//
//  QBaseVM.swift
//  Questions
//
//  Created by Nebo on 12.06.2022.
//

import Foundation
import RxSwift
import RxRelay

class QBaseVM {
    
    var downloadService: QDowloadServiceProtocol! { nil }
    
    var _parent: QBaseViewModel? { parent }
    var parent: QBaseViewModel?
    let dispBag = DisposeBag()
    
    init(parent: QBaseViewModel?)
    {
        self.parent = parent
    }
    
    func checkExistFile( url: String ) -> URL? {
        _parent?.checkExistFile(url: url)
    }
    
//    func rxDownloadImage( url: String, width: Int = 0, height: Int = 0 ) -> Single<String>
//    {
//        if let downloadService = downloadService
//        {
//            return downloadService
//                .RxDownloadImage( url: url, width: width, height: height )
//                .catchAndReturn( "" )
//                .observe( on: bindScheduler )
//        }
//
//        return Single.just( "" )
//    }
    
}

public protocol QDowloadServiceProtocol
{
    func RxDownload( url: String ) -> Single<String>
    func RxDownloadImage( url: String, width: Int, height: Int ) -> Single<String>
}
