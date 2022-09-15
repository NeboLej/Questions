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
    
    func Bind(vm: VM) {
        self.vm = vm
    }
    
}


