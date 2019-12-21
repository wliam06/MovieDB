//
//  Observable.swift
//  MovieDB
//
//  Created by William on 20/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

public final class Observable<Value> {
    struct Observer<Value> {
        weak var observer: AnyObject?
        let block: (Value) -> Void
    }

    private var observers = [Observer<Value>]()
    
    public var value: Value {
        didSet {
            // Notify observers
            notify()
        }
    }

    public init(_ value: Value) {
        self.value = value
    }

    public func observe(on observer: AnyObject, observerBlock: @escaping (Value) -> Void) {
        observers.append(Observer(observer: observer, block: observerBlock))
        DispatchQueue.main.async {
            observerBlock(self.value)
        }
    }

    public func remove(observer: AnyObject) {
        observers = observers.filter({$0.observer !== observer })
    }

    private func notify() {
        for observer in observers {
            DispatchQueue.main.async {
                observer.block(self.value)
            }
        }
    }
}
