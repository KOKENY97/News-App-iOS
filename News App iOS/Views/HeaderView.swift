//
//  HeaderView.swift
//  News App iOS
//
//  Created by user209843 on 5/6/22.
//

import UIKit

final class HeaderView: UIView {
    
    private var fontSize: CGFloat
    
    private lazy var headingLabel: UILabel = {
        let a = UILabel()
        a.translatesAutoresizingMaskIntoConstraints = false
        a.text = "BORNLOGIC NEWS"
        a.font = UIFont.boldSystemFont(ofSize: fontSize)
        return a
    }()
    
    private lazy var subheadlineLabel: UILabel = {
        let a = UILabel()
        a.translatesAutoresizingMaskIntoConstraints = false
        a.font = a.font.withSize(fontSize)
        a.text = "Breaking Events"
        a.textColor = .gray
        return a
    }()
    
    init(fontSize: CGFloat) {
        self.fontSize = fontSize
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(headingLabel)
        addSubview(subheadlineLabel)
        setupConstraints()
    }
    
    func setupConstraints() {
        //MARK: - News Header
        NSLayoutConstraint.activate([
            headingLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            headingLabel.topAnchor.constraint(equalTo: topAnchor),
        ])
        
        //MARK: - Subheadline
        NSLayoutConstraint.activate([
            subheadlineLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            subheadlineLabel.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 6),
            subheadlineLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
