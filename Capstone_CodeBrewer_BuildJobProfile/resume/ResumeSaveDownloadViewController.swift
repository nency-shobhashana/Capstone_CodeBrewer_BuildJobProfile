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
    var templateIndex: Int = 0
    var template: ResumeTemplate!
    var resumeTitle: String? = nil
    var resumeData: Dictionary<String, Any>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        template = resumeTemplate[templateIndex]
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
        var HTMLContent = template.content
        HTMLContent = HTMLContent.replacingOccurrences(of: "#FIRST_NAME", with: resumeData["firstName"] as? String ?? "")
        HTMLContent = HTMLContent.replacingOccurrences(of: "#LAST_NAME", with: resumeData["lastName"] as? String ?? "")
        HTMLContent = HTMLContent.replacingOccurrences(of: "#EMAIL", with: resumeData["email"] as? String ?? "")
        HTMLContent = HTMLContent.replacingOccurrences(of: "#NUMBER", with: resumeData["phone"] as? String ?? "")
        HTMLContent = HTMLContent.replacingOccurrences(of: "#ADDRESS", with: resumeData["address"] as? String ?? "")
        HTMLContent = HTMLContent.replacingOccurrences(of: "#PROFILE_LINK", with: resumeData["profileLink"] as? String ?? "")
        HTMLContent = HTMLContent.replacingOccurrences(of: "#LINKEDIN_LINK", with: resumeData["linkedInLink"] as? String ?? "")
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
        
        let fileURL = folderURL.appendingPathComponent("\(String(format: resumeTitle ?? "resume_\(templateIndex)" )).pdf")
        
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
