//
//  TabItem.swift
//  CustomTabbar
//
//  Created by jiwon Yoon on 2023/05/11.
//

import UIKit

enum TabItem: Int, CaseIterable {
    case home
    case chat
    case my
    
    var normalImage: UIImage? {
        switch self {
        case .home:
            return UIImage(systemName: "house")
        case .chat:
            return UIImage(systemName: "message")
        case .my:
            return UIImage(systemName: "person.crop.circle")
        }
    }
    
    var selectedImage: UIImage? {
        switch self {
        case .home:
            return UIImage(systemName: "house.fill")
        case .chat:
            return UIImage(systemName: "message.fill")
        case .my:
            return UIImage(systemName: "person.crop.circle.fill")
        }
    }
}
