//
//  ViewController.swift
//  Questions
//
//  Created by Nebo on 08.06.2022.
//

import UIKit

class QMainController: QBaseController<QMainViewModel> {
    
    @IBOutlet weak var newsView: UIView!
    
    lazy var kk = viewModel.rxString.map { ff in
        print(ff)
    }
    override func viewDidLayoutSubviews() {
        setupView()
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
//        initRx()
    }
    
//    func initRx() {
//        _ = viewModel.rxString.map { ff in
//            print(ff)
//        }
//    }

    private func setupView()
    {
        newsView.addInnerShadow()
    }
}

