//
//  TCRT5000.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 14.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class TCRT5000: NSObject {

    var signal: Float! = 0.0
    
    func setSignal( _ signal: Float! ) {
        
        self.signal = signal
        
        Session.shared.logger.addLine( "TCRT5000: \(self.signal!)" );
    }
    
    func touched() -> Bool! {
        
        return signal > 50.0
    }
}
