//
//  MostPopularViewedViewController.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 16/04/25.
//

import UIKit

class MostPopularViewedViewController: UIViewController {
    @IBOutlet weak var tblArticles: UITableView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    var articles: [Article] = []
    // MARK: - Properties
    var presenter: ViewToPresenterMostPopularViewedProtocol?
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presenter?.getArticles()
    }
    
    private func configureTableView(){
        tblArticles.delegate = self
        tblArticles.dataSource = self
        tblArticles.rowHeight = UITableView.automaticDimension
        tblArticles.register(UINib(nibName: ArticleCell.identifier, bundle: nil), forCellReuseIdentifier: ArticleCell.identifier)
    }
    
}

extension MostPopularViewedViewController: PresenterToViewMostPopularViewedProtocol{
    // TODO: Implement View Output Methods
    func setArticlesInView(_ articles: [Article]) {
        self.articles = articles
        self.loading.stopAnimating()
        self.tblArticles.reloadData()
    }
    
    func setErrorInView(_ error: any Error) {
        let alert = UIAlertController(title: Bundle.main.applicationName, message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}


extension MostPopularViewedViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.identifier, for: indexPath) as? ArticleCell else {
            return UITableViewCell()
        }
        cell.loadData(article: self.articles[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = self.articles[indexPath.row].url
        presenter?.goToDetail(article: url)
    }
    
}
