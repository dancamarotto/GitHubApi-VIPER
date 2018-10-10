//
//  PullRequestDetailsViewController.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 10/10/2018.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import UIKit
import WebKit

class PullRequestDetailsViewController: UIViewController, PullRequestDetailsView {

    static let viewID = "PullRequestDetailsViewID"
    var presenter: PullRequestDetailsPresentation!
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    func presentUrl(_ url: URL) {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        view = webView
        webView.load(URLRequest(url: url))
    }

}
