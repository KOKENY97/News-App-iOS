//
//  ImageView.swift
//  News App iOS
//
//  Created by user209843 on 5/6/22.
//

import UIKit

final class ImageView: UIView {
    var image: UIImage? {
        didSet {
            imageView.image = image
            
        }
    }
    
    private lazy var imageView: UIImageView = {
        let a = UIImageView()
        a.translatesAutoresizingMaskIntoConstraints = false
        a.contentMode = .scaleAspectFill
        a.layer.cornerRadius = 16
        a.clipsToBounds = true
        return a
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    func setupView() {
        addSubview(imageView)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 14),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14),
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.shouldRasterize = true
        imageView.layer.rasterizationScale = UIScreen.main.scale
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
