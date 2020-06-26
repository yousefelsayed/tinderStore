//
//  ViewController.swift
//  tinderStore
//
//  Created by Yousef on 6/21/20.
//  Copyright © 2020 Yousef. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    let topStackView = TopNavigationStackView()
    let bottomStackViewButtons = HomeBottomControlsStackView()
    let cardDeckView = UIView()
    let users = [User(name: "Sara", age: 22, imageName: "lady4c", profision: "Engineer"),
                User(name: "Nada", age: 23, imageName: "lady5c", profision: "iOS Developer"),
                User(name: "Yasmeen", age: 25, imageName: "jane2", profision: "QC Developer")]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupDummyCads()
    }
    
    fileprivate func setupDummyCads() {
        users.forEach { (user) in
            let cardView = CardView(frame: .zero)
            cardView.imageView.image = UIImage(named: user.imageName)
            cardView.informationLabel.text = "\(user.name) \(user.age)\n\(user.profision)"
            let attributedText = NSMutableAttributedString(string: user.name, attributes: [.font: UIFont.systemFont(ofSize: 25, weight: .heavy)])
            attributedText.append(NSMutableAttributedString(string: "  \(user.age)\n", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .regular)]))
            attributedText.append(NSMutableAttributedString(string: "\(user.profision)", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .regular)]))
            cardView.informationLabel.attributedText = attributedText
            self.cardDeckView.addSubview(cardView)
            cardView.fillSuperview()
        }
    }
    
    func setupLayout() {
        let overAllStackView = UIStackView(arrangedSubviews: [topStackView, cardDeckView, bottomStackViewButtons])
        overAllStackView.axis = .vertical
        overAllStackView.translatesAutoresizingMaskIntoConstraints = true
        view.addSubview(overAllStackView)
        overAllStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        overAllStackView.isLayoutMarginsRelativeArrangement = true
        overAllStackView.layoutMargins = .init(top: 0, left: 10, bottom: 0, right: 10)
        overAllStackView.bringSubviewToFront(cardDeckView)
    }
    
}

