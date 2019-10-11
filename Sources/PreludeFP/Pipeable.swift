//
//  Color.swift
//  PreludeFP
//
//  Created by duan on 2019/10/11.
//  Copyright © 2019 monk-studio. All rights reserved.
//

public func pipe<A, B>(_ a: A, _ fa: (A) -> B) -> B {
    return fa(a)
}

public func pipe<A, B, C>(_ a: A, _ fa: (A) -> B, _ fb: (B) -> C) -> C {
    return fb(fa(a))
}

public func pipe<A, B, C, D>(_ a: A, _ fa: (A) -> B, _ fb: (B) -> C, _ fc: (C) -> D) -> D {
    return fc(fb(fa(a)))
}
