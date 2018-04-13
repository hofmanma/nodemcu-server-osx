//
//  OutQueue.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 13.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class OutQueue: NSObject {
    
    static let shared: OutQueue! = OutQueue()
    
           let lock: NSLock! = NSLock()
           var responses: [MCUCommand]!
           var running: Bool!
    
    override init() {
        
        super.init()
        
        responses = [MCUCommand]()
        start()
    }
    
    func start() {
    
        running = true
        run()
    }
    
    func stop() {
        
        running = false
    }
    
    func enqueue( _ cmd: String! ) {
        
        responses.append( MCUCommand( cmd ))
    }
    
    func pop() {

        unlock()
        
        if responses.count > 0 {

            responses.remove(at: 0)
        }
    }
    
    func run() {
        
        DispatchQueue.global(qos: .userInitiated).async {
        
            while self.running == true {
            
                if let cmd = self.next() {
                
                    do {
                    
                        try cmd.send()
                    } catch {
                        
                        self.unlock()
                    }
                }
                
                usleep( 14000000 )
            }
            
            self.unlock()
        }
    }
    
    private func next() -> MCUCommand? {
        
        if lock.try() == false {
            
            return nil
        }
        
        if responses.count > 0 {
            
            return responses[ 0 ]
        } else {
            
            unlock()
            
            return nil
        }
    }
    
    private func unlock() {
        
        lock.unlock()
    }
}
