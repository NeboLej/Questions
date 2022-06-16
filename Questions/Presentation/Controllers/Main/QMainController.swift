//
//  ViewController.swift
//  Questions
//
//  Created by Nebo on 08.06.2022.
//

import UIKit

class QMainController: QBaseController<QMainViewModel> {
    
    @IBOutlet weak var newsView: UIView!
    
    override func viewDidLayoutSubviews() {
        setupView()
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }

    private func setupView()
    {
        newsView.addInnerShadow()
    }
}
