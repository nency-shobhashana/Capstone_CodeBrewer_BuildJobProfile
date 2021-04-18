//
//  CoverLetterSaveViewController.swift
//  Capstone_CodeBrewer_BuildJobProfile
//
//  Created by Nency on 4/18/21.
//

import UIKit
import WebKit

class CoverLetterSaveViewController: UIViewController {

    @IBOutlet weak var webPreview: WKWebView!
    var HTMLContent: String!
    var templateIndex: Int = 0
    var template: CoverLetterTemplate!
    var coverLetterTitle: String? = nil
    var coverLetterData: Dictionary<String, Any>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        template = coverLetterTemplate[templateIndex]
        // Do any additional setup after loading the view.
        createCoverLetterAsHTML()
    }
    
    func createCoverLetterAsHTML() {
        if let invoiceHTML = renderCoverLetter() {
            webPreview.loadHTMLString(invoiceHTML, baseURL:nil)
            HTMLContent = invoiceHTML
        }
    }
    
    func renderCoverLetter() -> String! {
        var HTMLContent = template.content
        HTMLContent = HTMLContent.replacingOccurrences(of: "#FIRST_NAME", with: coverLetterData["firstName"] as? String ?? "")
        HTMLContent = HTMLContent.replacingOccurrences(of: "#LAST_NAME", with: coverLetterData["lastName"] as? String ?? "")
        HTMLContent = HTMLContent.replacingOccurrences(of: "#EMAIL", with: coverLetterData["email"] as? String ?? "")
        HTMLContent = HTMLContent.replacingOccurrences(of: "#NUMBER", with: coverLetterData["phone"] as? String ?? "")
        HTMLContent = HTMLContent.replacingOccurrences(of: "#ADDRESS", with: coverLetterData["address"] as? String ?? "")
        HTMLContent = HTMLContent.replacingOccurrences(of: "#PROFILE_LINK", with: coverLetterData["profileLink"] as? String ?? "")
        HTMLContent = HTMLContent.replacingOccurrences(of: "#LINKEDIN_LINK", with: coverLetterData["linkedInLink"] as? String ?? "")
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
        
        let fileURL = folderURL.appendingPathComponent("\(String(format: coverLetterTitle ?? "cover_\(templateIndex)" )).pdf")
        
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

}