//
//  CardView.swift
//  tinderStore
//
//  Created by Yousef on 6/24/20.
//  Copyright © 2020 Yousef. All rights reserved.
//

import UIKit

class CardView: UIView {
    let imageView = UIImageView(image: #imageLiteral(resourceName: "kelly3"))
    let informationLabel = UILabel()
    fileprivate var threshould: CGFloat = 100
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        imageView.fillSuperview()
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        self.imageView.contentMode = .scaleToFill
        setupLabels()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panHandle))
        addGestureRecognizer(panGesture)
    }
    
    fileprivate func setupLabels() {
        self.addSubview(informationLabel)
        informationLabel.numberOfLines = 0
        self.informationLabel.textColor = .white
        self.informationLabel.anchor(top: nil, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor,padding: .init(top: 0, left: 16, bottom: 16, right: 16))
        self.informationLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
    }
    
    @objc fileprivate func panHandle(panGetsture: UIPanGestureRecognizer) {
        switch panGetsture.state {
        case .changed:
            handleChanged(panGetsture)
        case .ended:
            handleEnded(panGetsture)
        default:
            ()
        }
    }
    
    fileprivate func handleChanged(_ panGetsture: UIPanGestureRecognizer) {
        let translation = panGetsture.translation(in: nil)
        let degree: CGFloat = translation.x / 20
        let angel = degree * .pi / 180
        let rotationlaTranslation  = CGAffineTransform(rotationAngle: angel)
        self.transform = rotationlaTranslation.translatedBy(x: translation.x, y: translation.y)
    }
    
    fileprivate func handleEnded(_ panGetsture: UIPanGestureRecognizer) {
        let translationDirection: CGFloat = panGetsture.translation(in: nil).x > 0 ? 600 : -600
        let shouldDimissCard = abs(panGetsture.translation(in: nil).x) > threshould
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            if shouldDimissCard {
                self.transform = .identity
                    self.frame = CGRect(x: translationDirection, y: 0, width: self.frame.width, height: self.frame.height)
            } else {
                self.transform = .identity
            }
        }) { (_) in
            self.transform = .identity
            if shouldDimissCard {
                self.removeFromSuperview()
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
