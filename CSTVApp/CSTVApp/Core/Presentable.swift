//
//  Presentable.swift
//  App
//
//  Created by Felipe Santolim on 12/04/23.
//

import Foundation
import UIKit

public protocol Presentable: UIViewController { }
extension UINavigationController: Presentable { }

extension Presentable {
    public func toPresent() -> UIViewController {
        return self
    }
}
