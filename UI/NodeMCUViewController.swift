//
//  NodeMCUViewController.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 12.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class NodeMCUViewController: NSViewController {

    @IBOutlet weak var butD0: NSButton!
    @IBOutlet weak var butD1: NSButton!
    @IBOutlet weak var butD2: NSButton!
    @IBOutlet weak var butD3: NSButton!
    @IBOutlet weak var butD4: NSButton!
    @IBOutlet weak var butD5: NSButton!
    @IBOutlet weak var butD6: NSButton!
    @IBOutlet weak var butD7: NSButton!
    @IBOutlet weak var butD8: NSButton!
    
    @IBOutlet weak var butA0: NSButton!
    @IBOutlet weak var butA1: NSButton!
    @IBOutlet weak var butA2: NSButton!
    @IBOutlet weak var butA3: NSButton!
    @IBOutlet weak var butA4: NSButton!
    @IBOutlet weak var butA5: NSButton!
    @IBOutlet weak var butA6: NSButton!
    @IBOutlet weak var butA7: NSButton!
    @IBOutlet weak var butA8: NSButton!
    
    @IBOutlet weak var lblD0: NSTextField!
    @IBOutlet weak var lblD1: NSTextField!
    @IBOutlet weak var lblD2: NSTextField!
    @IBOutlet weak var lblD3: NSTextField!
    @IBOutlet weak var lblD4: NSTextField!
    @IBOutlet weak var lblD5: NSTextField!
    @IBOutlet weak var lblD6: NSTextField!
    @IBOutlet weak var lblD7: NSTextField!
    @IBOutlet weak var lblD8: NSTextField!
    
    @IBOutlet weak var lblA0: NSTextField!
    @IBOutlet weak var lblA1: NSTextField!
    @IBOutlet weak var lblA2: NSTextField!
    @IBOutlet weak var lblA3: NSTextField!
    @IBOutlet weak var lblA4: NSTextField!
    @IBOutlet weak var lblA5: NSTextField!
    @IBOutlet weak var lblA6: NSTextField!
    @IBOutlet weak var lblA7: NSTextField!
    @IBOutlet weak var lblA8: NSTextField!
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateControls()
        startTimer()
    }
    
    override var representedObject: Any? {
        didSet {
        }
    }
    
    private func startTimer( ){
        
        guard (self.timer != nil ) else {
            
            self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(1),
                                              target: self,
                                              selector: (#selector(nextLoop)),
                                              userInfo: nil,
                                              repeats: true );
            return;
        }
    }
    
    private func stopTimer(){
        
        if let _ = self.timer {
            
            self.timer.invalidate();
            self.timer = nil;
        }
    }
    
    @objc func nextLoop() {
        
        updateControls()
    }
    
    private func updateControls() {
        
        lblD0.stringValue = "\(NodeMCU.IC.digitalPort( 0 ).signal()!)"
        lblD1.stringValue = "\(NodeMCU.IC.digitalPort( 1 ).signal()!)"
        lblD2.stringValue = "\(NodeMCU.IC.digitalPort( 2 ).signal()!)"
        lblD3.stringValue = "\(NodeMCU.IC.digitalPort( 3 ).signal()!)"
        lblD4.stringValue = "\(NodeMCU.IC.digitalPort( 4 ).signal()!)"
        lblD5.stringValue = "\(NodeMCU.IC.digitalPort( 5 ).signal()!)"
        lblD6.stringValue = "\(NodeMCU.IC.digitalPort( 6 ).signal()!)"
        lblD7.stringValue = "\(NodeMCU.IC.digitalPort( 7 ).signal()!)"
        lblD8.stringValue = "\(NodeMCU.IC.digitalPort( 8 ).signal()!)"
        
        lblA0.stringValue = "\(NodeMCU.IC.analogPort( 0 ).signal()!)"
        lblA1.stringValue = "\(NodeMCU.IC.analogPort( 1 ).signal()!)"
        lblA2.stringValue = "\(NodeMCU.IC.analogPort( 2 ).signal()!)"
        lblA3.stringValue = "\(NodeMCU.IC.analogPort( 3 ).signal()!)"
        lblA4.stringValue = "\(NodeMCU.IC.analogPort( 4 ).signal()!)"
        lblA5.stringValue = "\(NodeMCU.IC.analogPort( 5 ).signal()!)"
        lblA6.stringValue = "\(NodeMCU.IC.analogPort( 6 ).signal()!)"
        lblA7.stringValue = "\(NodeMCU.IC.analogPort( 7 ).signal()!)"
        lblA8.stringValue = "\(NodeMCU.IC.analogPort( 8 ).signal()!)"
    }
}
