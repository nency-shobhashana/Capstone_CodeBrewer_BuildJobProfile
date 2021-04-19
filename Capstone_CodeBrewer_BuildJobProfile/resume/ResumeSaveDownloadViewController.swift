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
        HTMLContent = HTMLContent.replacingOccurrences(of: "#PROF_SUMMARY", with: resumeData["preofessionalSummary"] as? String ?? "")
        
        var educationContent = ""
        if let match = HTMLContent.range(of: "(?<=#COLLEGE_START#).+(?=#COLLEGE_END#)", options: .regularExpression) {
            educationContent = (resumeData["education"] as? Array<Dictionary<String, String>>)?.map({ (data) -> String in
                var raw = HTMLContent.substring(with: match)
                raw = raw.replacingOccurrences(of: "#COLLEGE_NAME", with: data["name"] as? String ?? "")
                raw = raw.replacingOccurrences(of: "#MAJOR", with: data["major"] as? String ?? "")
                raw = raw.replacingOccurrences(of: "#START_DATE", with: data["startYear"] as? String ?? "")
                raw = raw.replacingOccurrences(of: "#END_DATE", with: data["endYear"] as? String ?? "")
                return raw
            }).joined() ?? ""
        }
        
        let educationReplaceRange = HTMLContent.range(of: "(?=#COLLEGE_START#).+(?:#COLLEGE_END#)", options: .regularExpression)
        HTMLContent.replaceSubrange(educationReplaceRange!, with: educationContent)
        
        HTMLContent = HTMLContent.replacingOccurrences(of: "#SKILLS", with: resumeData["skills"] as? String ?? "")
        
        var expContent = ""
        if let match = HTMLContent.range(of: "(?<=#EXP_START#).+(?=#EXP_END#)", options: .regularExpression) {
            expContent = (resumeData["experience"] as? Array<Dictionary<String, String>>)?.map({ (data) -> String in
                var raw = HTMLContent.substring(with: match)
                raw = raw.replacingOccurrences(of: "#ROLE", with: data["role"] as? String ?? "")
                raw = raw.replacingOccurrences(of: "#EXP_START_DATE", with: data["startYear"] as? String ?? "")
                raw = raw.replacingOccurrences(of: "#EXP_END_DATE", with: data["endYear"] as? String ?? "")
                raw = raw.replacingOccurrences(of: "#COMPANY_NAME", with: data["name"] as? String ?? "")
                raw = raw.replacingOccurrences(of: "#DESCRIPTION", with: data["description"] as? String ?? "")
                return raw
            }).joined() ?? ""
        }
        
        let expnReplaceRange = HTMLContent.range(of: "(?=#EXP_START#).+(?:#EXP_END#)", options: .regularExpression)
        HTMLContent.replaceSubrange(expnReplaceRange!, with: expContent)
        
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
