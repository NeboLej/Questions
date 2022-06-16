//
//  QBaseController.swift
//  Questions
//
//  Created by Nebo on 17.06.2022.
//

import UIKit
import RxSwift

class QBaseController<VM: QBaseViewModel> : UIViewController {
    
    let dispBag = DisposeBag()
    var bindScheduler: SchedulerType = MainScheduler.asyncInstance
    
    private(set) public var viewModel: VM! = nil
    
    public func BindVM( vm: QBaseViewModel )
    {
        viewModel = (vm as! VM)
    }
    
}
