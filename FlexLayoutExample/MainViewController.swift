//
//  MainViewController.swift
//  FlexLayoutExample
//
//  Created by Jaedoo Ko on 2020/12/27.
//

import UIKit
import FlexLayout
import SnapKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        let subview = Example1View()
        
        view.addSubview(subview)
        subview.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

