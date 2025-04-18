//
//  ArticleDetailViewController.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 17/04/25.
//

import UIKit
import WebKit

class ArticleDetailViewController: UIViewController {
    @IBOutlet weak var wvArticle: WKWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    // MARK: - Properties
    var presenter: ViewToPresenterArticleDetailProtocol?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configuereWebView()
        self.presenter?.loadURL()
    }
    
    private func configuereWebView(){
        self.wvArticle.navigationDelegate = self
    }

}

extension ArticleDetailViewController: PresenterToViewArticleDetailProtocol{
    func loadURL(url: URLRequest?) {
        if let urlRequest = url {
            wvArticle.load(urlRequest)
        }
    }
}

extension ArticleDetailViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loading.stopAnimating()
    }
}

