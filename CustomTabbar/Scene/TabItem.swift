//
//  TabItem.swift
//  CustomTabbar
//
//  Created by jiwon Yoon on 2023/05/11.
//

import UIKit

enum TabItem: Int, CaseIterable {
    case home
    case search
    case menu
    case person
    case shop
    
    var iconImage: (default: UIImage?, selected: UIImage?) {
        switch self {
        case .home:
            return (
                UIImage(systemName: "house"),
                UIImage(systemName: "house.fill")
            )
        case .search:
            return (
                UIImage(systemName: "magnifyingglass"),
                UIImage(systemName: "magnifyingglass")
            )
        case .menu:
            return (
                nil,
                nil
            )
        case .person:
            return (
                UIImage(systemName: "person"),
                UIImage(systemName: "person.fill")
            )
        case .shop:
            return (
                UIImage(systemName: "bag"),
                UIImage(systemName: "bag.fill")
            )
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return ""
        case .search:
            return ""
        case .menu:
            return "MENU"
        case .person:
            return ""
        case .shop:
            return ""
        }
    }
}
