//
//  QBaseCollectionViewCell.swift
//  Questions
//
//  Created by Nebo on 12.06.2022.
//

import UIKit
import RxSwift

class QBaseCollectionViewCell<VM: QBaseVM>: UICollectionViewCell {
    
    var vm: VM! = nil
    var imageDisp: Disposable? = nil
    
    deinit {
        imageDisp?.dispose()
    }
    
    func Bind(vm: VM) {
        self.vm = vm
    }
    
    func Bind(url: String, to: UIImageView, width: Int = 0, height: Int = 0, placeholder: String? = nil, activity: UIActivityIndicatorView? = nil) {
        if let u = vm.checkExistFile(url: url) {
            activity?.isHidden = true
            to.image = UIImage( contentsOfFile: u.path )
            
        } else {
            activity?.isHidden = false
            activity?.startAnimating()
            
            imageDisp?.dispose()
            to.image = nil
            imageDisp = vm
                .RxDownloadImage( url: url, width: UIScreen.res( res: width ), height: UIScreen.res( res: height ) )
                .map { $0.isEmpty ? (placeholder == nil ? nil : UIImage( named: placeholder! )) : UIImage( contentsOfFile: $0 ) }
                .do( onDispose: { activity?.isHidden = true } )
                .asObservable()
                .bind( to: to.rx.image )
        }
    }
    
}


