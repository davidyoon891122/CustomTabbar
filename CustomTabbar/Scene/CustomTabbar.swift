//
//  CustomTabbar.swift
//  CustomTabbar
//
//  Created by jiwon Yoon on 2023/05/11.
//

import UIKit

final class CustomTabbar: UIView {
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        
        return stackView
    }()
    
    private let tabItems: [TabItem]
    private var tabButtons = [UIButton]()
    private var selectedIndex = 0 {
        didSet {
            updateUI()
        }
    }
    
    init(tabItems: [TabItem]) {
        self.tabItems = tabItems
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateUI() {
        tabItems
            .enumerated()
            .forEach { i, item in
                let isButtonSelected = selectedIndex == i
                let image = isButtonSelected ? item.selectedImage : item.normalImage
                let selectedButton = tabButtons[i]
                
                selectedButton.setImage(image, for: .normal)
                selectedButton.setImage(image, for: .highlighted)
            }
    }
    
    private func setup() {
        defer { updateUI() }
        
        tabItems
            .enumerated()
            .forEach { i, item in
                let button = UIButton()
                button.setImage(item.normalImage, for: .normal)
                button.setImage(item.normalImage, for: .highlighted)
                button.addAction(UIAction(handler: { [weak self] _ in
                    self?.selectedIndex = i
                }), for: .touchUpInside)
                tabButtons.append(button)
                stackView.addArrangedSubview(button)
            }
        backgroundColor = .systemGray.withAlphaComponent(0.2)
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
        ])
    }
    
}
