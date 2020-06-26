//
//  HomeBottomControlsStackView.swift
//  tinderStore
//
//  Created by Yousef on 6/21/20.
//  Copyright © 2020 Yousef. All rights reserved.
//

import UIKit

class HomeBottomControlsStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution  = .fillEqually
        heightAnchor.constraint(equalToConstant: 100).isActive = true
        let bottomSubViews = [#imageLiteral(resourceName: "refresh"), #imageLiteral(resourceName: "dismiss"), #imageLiteral(resourceName: "superLike"), #imageLiteral(resourceName: "like"), #imageLiteral(resourceName: "boost")].map { (img) -> UIView in
            let button = UIButton(type: .system)
            button.setImage(img.withRenderingMode(.alwaysOriginal), for: .normal)
            return button
        }
        bottomSubViews.forEach { (v) in
            addArrangedSubview(v)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
