//
//  RootViewController.swift
//  CustomTabbar
//
//  Created by jiwon Yoon on 2023/05/11.
//

import UIKit

final class RootViewController: UIViewController {
    private let tabbarView = CustomTabbar(tabItems: [.home, .chat, .my])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        view.addSubview(tabbarView)
        
        tabbarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tabbarView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tabbarView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tabbarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tabbarView.heightAnchor.constraint(equalToConstant: 56.0),
            tabbarView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
        ])
    }
}
