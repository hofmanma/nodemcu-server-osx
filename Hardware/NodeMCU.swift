//
//  NodeMCU.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 12.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class NodeMCU: NSObject {

    static let IC: NodeMCU! = NodeMCU()
           let tcrt: TCRT5000! = TCRT5000()
    
    var digitalPorts: [Port]!
    var analogPorts: [Port]!
    
    override init() {
        
        super.init()
        
        digitalPorts = [Port]()
        analogPorts = [Port]()

        for port in 0...8 {
            
            digitalPorts.append( Port( port, 0 ));
            analogPorts.append( Port( port, 0 ));
        }
    }
    
    func digitalPort( _ id: Int! ) -> Port! {
        
        let ports = digitalPorts.filter( { (port) -> Bool in
            
            return port.id == id
        })
        
        return ports[ 0 ]
    }
    
    func analogPort( _ id: Int! ) -> Port! {
        
        let ports = analogPorts.filter( { (port) -> Bool in
            
            return port.id == id
        })
        
        return ports[ 0 ]
    }
}
