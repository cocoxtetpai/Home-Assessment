//
//  HTMLViewCell.swift
//  Home-Assessment
//
//  Created by Coco Xtet Pai on 20/10/2019.
//  Copyright © 2019 Ko Ko Htet Paing. All rights reserved.
//

import UIKit
import WebKit

class HTMLViewCell: UICollectionViewCell {

    var webView: WKWebView!
    var isLoadedWebView = false
    @IBOutlet weak var webContentView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func loadUI() {
                
        guard !isLoadedWebView else {
            return
        }
        
        webView = WKWebView(frame: self.bounds)
        webView.backgroundColor = .yellow
        webContentView.addSubview(webView)

        let color = UIColor.random()
        
        self.backgroundColor = color
        webContentView.backgroundColor = color
        webView.backgroundColor = color
        webView.navigationDelegate = self
    webView.loadHTMLString(String().getHTMLStringWithRandomTextAndColor(frame: self.frame, color: color), baseURL: nil)
        
    }

}

extension HTMLViewCell: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        isLoadedWebView = true
    }
}
