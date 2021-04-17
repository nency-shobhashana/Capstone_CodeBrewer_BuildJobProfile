//
//  ResumeSaveDownloadViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/16/21.
//

import UIKit
import WebKit

class ResumeSaveDownloadViewController: UIViewController {
    
    @IBOutlet weak var webPreview: WKWebView!
    var HTMLContent: String!
    var template: String = "template 1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        createResumeAsHTML()
    }
    
    func createResumeAsHTML() {
        if let invoiceHTML = renderResume() {
            webPreview.loadHTMLString(invoiceHTML, baseURL:nil)
            HTMLContent = invoiceHTML
        }
    }
    
    func renderResume() -> String! {
        let HTMLContent = "<html><body><h2>Real-time online HTML editor</h2><p>Create and edit <a href=\"https://validator.w3.org/\" rel=\"nofollow\" target=\"_blank\" title=\"W3C HTML validator\">W3C valid HTML code</a> without writing a single line of code. The WYSIWYG editor on the left helps non-developers write their own <em>high-quality HTML code</em>.</p><h3>Know some code?&nbsp;</span></h3><p>The editing works both ways, with live visual feedback. Write some markup code on the right, and it will appear in the left editor.</p></body></html>"
        return HTMLContent
    }
    
    @IBAction func downloadClicked(_ sender: Any) {
        do {
            let pdfData = try exportHTMLContentToPDF(HTMLContent: self.HTMLContent)
            let activityViewController = UIActivityViewController(activityItems: [pdfData], applicationActivities: nil)
            present(activityViewController, animated: true, completion: nil)
        } catch {
            print("error")
        }
        
    }
    @IBAction func saveClicked(_ sender: Any) {
        do {
            try exportHTMLContentToPDF(HTMLContent: self.HTMLContent)
            navigationController?.popToRootViewController(animated: true)
        } catch {
            print("error")
        }
        
    }
    func exportHTMLContentToPDF(HTMLContent: String) throws -> URL! {
        let printPageRenderer = CustomPrintPageRenderer()
        
        let printFormatter = UIMarkupTextPrintFormatter(markupText: HTMLContent)
        printPageRenderer.addPrintFormatter(printFormatter, startingAtPageAt: 0)
        
        let pdfData = drawPDFUsingPrintPageRenderer(printPageRenderer: printPageRenderer)
        
        let folderURL = try FileManager.default.url(
            for: .downloadsDirectory,
            in: .allDomainsMask,
            appropriateFor: nil,
            create: true
        )
        
        let fileURL = folderURL.appendingPathComponent("\(template).pdf")
        
        let pdfFilename = fileURL
        pdfData?.write(to: pdfFilename, atomically: true)
        
        print(pdfFilename)
        return pdfFilename
    }
    
    func drawPDFUsingPrintPageRenderer(printPageRenderer: UIPrintPageRenderer) -> NSData! {
        let data = NSMutableData()
        
        UIGraphicsBeginPDFContextToData(data, .zero, nil)
        
        UIGraphicsBeginPDFPage()
        
        printPageRenderer.drawPage(at: 0, in: UIGraphicsGetPDFContextBounds())
        
        UIGraphicsEndPDFContext()
        
        return data
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
