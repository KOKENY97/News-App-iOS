//
//  NewsTableViewCell.swift
//  News App iOS
//
//  Created by user209843 on 5/6/22.
//

import UIKit

final class NewsTableViewCell: UITableViewCell {
    
    var newsVM: NewsViewModel? {
        didSet {
            if let newsVM = newsVM {
                titleLabel.text = newsVM.title
                NetworkManager.shared.getImage(urlString: newsVM.urlToImage) { (data) in
                    guard let data = data else { return }
                    DispatchQueue.main.async {
                        self.newsImage.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    
    var newsImageData: Data? {
        didSet {
            if let data = newsImageData {
                newsImage.image = UIImage(data: data)
            }
        }
    }
    
    private lazy var newsImage: ImageView = {
        let a = ImageView()
        a.translatesAutoresizingMaskIntoConstraints = false
        return a
    }()
    
    private lazy var titleLabel: UILabel = {
       let a = UILabel()
        a.translatesAutoresizingMaskIntoConstraints = false
        a.numberOfLines = 0
        return a
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(titleLabel)
        addSubview(newsImage)
        setupConstraints()
    }
    
    func setupConstraints() {
        //MARK: - News Image
        NSLayoutConstraint.activate([
            newsImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsImage.topAnchor.constraint(equalTo: topAnchor),
            newsImage.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        //MARK: - Title Label
        NSLayoutConstraint.activate([
          titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
          titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
          titleLabel.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 8),
          titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14),
        ])
    }
    
}
