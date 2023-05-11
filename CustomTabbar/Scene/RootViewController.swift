//
//  RootViewController.swift
//  CustomTabbar
//
//  Created by jiwon Yoon on 2023/05/11.
//

import UIKit
import RxSwift
import SnapKit

final class RootViewController: UIViewController {
    private lazy var tabbarController: CustomTabbarController = {
        let tabbarController = CustomTabbarController()
        tabbarController.modalPresentationStyle = .fullScreen
        return tabbarController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        present(tabbarController, animated: true)
    }
}
