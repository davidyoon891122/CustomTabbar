//
//  CustomTabbar.swift
//  CustomTabbar
//
//  Created by jiwon Yoon on 2023/05/11.
//

import UIKit
import RxSwift
import RxCocoa

final class CustomTabbar: UIView {
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        
        return stackView
    }()
    
    let items: [TabItem] = TabItem.allCases
    private var tabButtons = [UIButton]()
    fileprivate var selectedIndex = 0 {
        didSet {
            tabButtons
                .enumerated()
                .forEach { i, btn in
                    btn.isSelected = i == selectedIndex
                }
        }
    }
    
    private let disposeBag = DisposeBag()
    fileprivate var tapSubject = PublishSubject<Int>()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateUI() {
        items
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
        items
            .enumerated()
            .forEach { i, item in
                let button = UIButton()
                button.setImage(item.normalImage, for: .normal)
                button.setImage(item.normalImage, for: .highlighted)
                button.isSelected = i == 0
                button.rx.tap
                    .map { _ in
                        i
                    }.bind(to: tapSubject)
                    .disposed(by: disposeBag)
                tabButtons.append(button)
            }
        
        tapSubject
            .bind(to: rx.selectedIndex)
            .disposed(by: disposeBag)
        
        backgroundColor = .lightGray
        
        addSubview(stackView)
        tabButtons.forEach(stackView.addArrangedSubview(_:))
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}

extension Reactive where Base: CustomTabbar {
    var tabButton: Observable<Int> {
        base.tapSubject
    }
    
    var changeIndex: Binder<Int> {
        Binder(base) { base, index in
            base.selectedIndex = index
        }
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct CustomTabbarPreview: PreviewProvider {
    static var previews: some View {
        UIView.UIViewPreview {
            CustomTabbar()
        }
        .frame(width: UIScreen.main.bounds.width, height: 80.0)
        .previewLayout(.sizeThatFits)
    }
}

#endif
