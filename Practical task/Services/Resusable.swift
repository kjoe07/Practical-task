//
//  Resusable.swift
//  TopDriver
//
//  Created by Yoel Jimenez del Valle on 7/22/20.
//  Copyright © 2020 Yoel Jimenez del Valle. All rights reserved.
//

import UIKit

/// Protocol that add a string var named ReuseIdentifier to each UICollectionView cell to return the class name as cell identifier
protocol Identifier {
    static var identifier: String {get}
}
//extension Identifier{
//    static var indentifier: String{ return String(describing: self)}
//}
extension UIViewController: Identifier {
    static var identifier: String {
        return String(describing: self)
    }
}

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String { return String(describing: self) }
}

extension UITableViewCell: Reusable { }
