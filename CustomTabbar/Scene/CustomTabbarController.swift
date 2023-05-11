//
//  CustomTabbarController.swift
//  CustomTabbar
//
//  Created by jiwon Yoon on 2023/05/11.
//

import UIKit
import RxSwift

final class CustomTabbarController: UIViewController {
    fileprivate let tabbar = CustomTabbar()
    private var childVCs = [UIViewController]()
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

private extension CustomTabbarController {
    private func setup() {
        setupTabbar()
        setupTabbarControllers()
        setupBind()
    }
    
    private func setupTabbar() {
        view.addSubview(tabbar)
        
        tabbar.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-50)
        }
    }
    
    private func setupTabbarControllers() {
        tabbar.items
            .forEach { item in
                let vc: UIViewController =  {
                    let viewController = UIViewController()
                    return viewController
                }()
                
                vc.view.backgroundColor = .white
                let title = String(describing: item)
                addLabel(in: vc, text: title)
                
                addChild(vc)
                view.addSubview(vc.view)
                vc.didMove(toParent: self)
                
                vc.view.snp.makeConstraints {
                    $0.top.leading.trailing.equalToSuperview()
                    $0.bottom.equalTo(tabbar.snp.top)
                }
                
                childVCs.append(vc)
            }
        
        guard let shouldFrontView = childVCs[0].view else { return }
        view.bringSubviewToFront(shouldFrontView)
    }
    
    private func setupBind() {
        tabbar.rx.tabButton
            .bind(with: self) { ss, index in
                guard let shouldFrontView = ss.childVCs[index].view else { return }
                ss.view.bringSubviewToFront(shouldFrontView)
            }
            .disposed(by: disposeBag)
    }
    
    private func addLabel(in vc: UIViewController, text: String?) {
        let label: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 24)
            label.textColor = .black
            label.text = text
            
            return label
        }()
        
        vc.view.addSubview(label)
        
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

extension Reactive where Base: CustomTabbarController {
    var changeTabbarIndex: Binder<Int> {
        Binder(base) { base, index in
            base.tabbar.rx.changeIndex.onNext(index)
        }
    }
}
