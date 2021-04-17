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
        let HTMLContent = "<html><body><table><tr><td><table width=100%><tr><td align=center><h2>Nency Shobhashana</h2></td></tr><tr><td align=center>Web Developer</td></tr><tr><td align=center>shobhashananency@gmail.com</td></tr><tr><td align=center>+1 647 676 0708</td></tr><tr><td align=center>Brampton, ON, Canada</td></tr><tr><td>&nbsp;</td></tr></table></td></tr><tr><td><table width=100%><tr><td><h3><u>PROFESSIONAL SUMMARY</u></h3></td></tr><tr><td>Nency is a <b>sophomore</b> at <b>Lambton College</b> majoring in <b>Mobile application development</b> and has <b>3 years</b> of experience in <b>UI/UX development</b>. Committed to delivering high-level solutions that increase business and result in exceptional cost efficiencies and seeking an opportunity where she can apply herself to challenging opportunities in connecting business requirements with Emerging Technologie.</td></tr><tr><td>&nbsp;</td></tr></table></td></tr><tr><td><table width=100%><tr><td><h3><u>EDUCATION</u></h3></td></tr><tr><td><b>Mobile application Design and Development</b> Lambton College in Toronto, Toronto, ON, Canada</td></tr><tr><td align=right>[Sep 2020, May 2022]</td></tr><tr><td><b>Bachelor of Engineering in Information & Technology</b> Ganpat University, Gujarat, India</td></tr><tr><td align=right>[July 2012, Jun 2016]</td></tr><tr><td>&nbsp;</td></tr></table></td></tr><tr><td><table width=100%><tr><td><h3><u>KEY SKILLS</u></h3></td></tr><tr><td>Android, Java, Swift, iOs, Angularjs, Angular(5), typeScript, C/C++, VC++, Asp & Vb.net, PHP, Python, HTML(5), CSS(3), SASS/SCSS, Bootstrap, jQuery, JavaScript, WordPress theming, Drupal theming, PSD to HTML, Responsive design, XHTML, Matlab, Node.js, AJAX & JSON, MySQL, Oracle, MS Access, SQLite</td></tr><tr><td>&nbsp;</td></tr></table></td></tr><tr><td><table width=100%><tr><td><h3><u>PROFESSIONAL EXPERIENCE</u></h3></td></tr><tr><td><table width=100%><tr><td><b>Web Developer</b> at Parex Technologies, Ahmedabad</td></tr><tr><td>[April 2018, March 2019]</td></tr><tr><td><p>Joined as Web developer and worked in designing and developing a website with modern front-end Javascript frameworks like Angular 2+. Used Rest API to communicate with a backend server. Along with web designing in CMS like WordPress. Also created templates of high-quality user interfaces and visual designs prototype by using tools like Photoshop, Justinmind, and other Sketch libraries. Closely worked with clients, BA, and QA team in an Agile methodology.</p></td></tr><tr><td>&nbsp;</td></tr></table></td></tr><tr><td><table width=100%><tr><td><b>UI Developer</b> at Joykal Infotech, Ahmedabad</td></tr><tr><td>[Jan 2018 – Apr 2018]</td></tr><tr><td><p>Joined as a UI developer and here I mainly worked in creating web applications with new and modern market trend designs using HTML(5), CSS(3), SASS, Bootstrap, jQuery, Javascript, and Responsive design with more proficiency.</p></td></tr><tr><td>&nbsp;</td></tr></table></td></tr><tr><td><table width=100%><tr><td><b>UI Developer</b> at Addweb Solution Infotech, Ahmedabad</td></tr><tr><td>[July 2016 – Dec 2018]</td></tr><tr><td><p>Joined as a trainee UI/UX developer. I started working on UI designing from my very first project. During my employment, worked on various web projects created many pages mainly using HTML(5), CSS(3), Bootstrap, jQuery, Javascript, PSD to HTML, Gulp, Responsive design for all devices, and Drupal theming, various task managers like GIT, JIRA, FileZilla, Bitbucket.</p></td></tr><tr><td>&nbsp;</td></tr></table></td></tr></table></td></tr></table></body></html>"
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
