//
//  Observer.swift
//  App
//
//  Created by Felipe Santolim on 12/04/23.
//

import Foundation

public class Observer<T> {
    
    public var value: T? {
        didSet {
            listener?(value)
        }
    }
    
    public init(_ value: T?) {
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?
    
    public func bind(_ listener: @escaping (T?) -> Void) {
        if let value = value {
            listener(value)
        }
        self.listener = listener
    }
}
