//
//  CustomPrintPageRenderer.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/17/21.
//

import UIKit

class CustomPrintPageRenderer: UIPrintPageRenderer {

    let A4PageWidth: CGFloat = 595.2
    
    let A4PageHeight: CGFloat = 841.8
    
    
    override init() {
        super.init()
        
        // Specify the frame of the A4 page.
        let pageFrame = CGRect(x: 0.0, y: 0.0, width: A4PageWidth, height: A4PageHeight)
        
        // Set the page frame.
        self.setValue(NSValue(cgRect: pageFrame), forKey: "paperRect")
        
        // Set the horizontal and vertical insets (that's optional).
        // self.setValue(NSValue(CGRect: pageFrame), forKey: "printableRect")
        self.setValue(NSValue(cgRect: pageFrame.insetBy(dx: 10.0, dy: 10.0)), forKey: "printableRect")
        
        
        self.headerHeight = 50.0
        self.footerHeight = 50.0
    }
    
}
