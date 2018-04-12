//
//  Port.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 12.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class Port: NSObject {

    let id: Int
    var value: Float
    
    init( _ id: Int!, _ value: Float! ) {
    
        self.id = id
        self.value = value
    }
    
    func toString() -> String! {
        
        return "\(id):\(value)"
    }
    
    func setSignal( _ value: Float! ) {
        
        self.value = value
    }
    
    func signal() -> Float! {
        
        return self.value
    }
}
