//
//  NewsVC.swift
//  News App iOS
//
//  Created by user209843 on 5/6/22.
//

import UIKit
import SafariServices

class NewsVC: UIViewController {
    
    var viewModel = NewsListViewModel()
    
    private lazy var headerView: HeaderView = {
        let a = HeaderView(fontSize: 32)
        return a
    }()
    
    private lazy var tableView: UITableView = {
        let a = UITableView()
        a.translatesAutoresizingMaskIntoConstraints = false
        a.tableFooterView = UIView()
        a.register(NewsTableViewCell.self, forCellReuseIdentifier: viewModel.reuseID)
        a.delegate = self
        a.dataSource = self
        return a
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        fetchNews()
    }
    
    func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(headerView)
        view.addSubview(tableView)
        setupConstraints()
    }
    
    func setupConstraints() {
        //MARK: - Header View
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
        ])
        
        //MARK: - Table View
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func fetchNews() {
        viewModel.getNews { (_) in
            self.tableView.reloadData()
        }
    }
}

extension NewsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.newsVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.reuseID, for: indexPath) as? NewsTableViewCell
        let news = viewModel.newsVM[indexPath.row]
        cell?.newsVM = news
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = viewModel.newsVM[indexPath.row]
        guard let url = URL(string: news.url) else {
            return
        }
        
        let config = SFSafariViewController.Configuration()
        let safariViewController = SFSafariViewController(url: url, configuration: config)
        safariViewController.modalPresentationStyle = .formSheet
        present(safariViewController, animated: true)
    }
    
    
}
