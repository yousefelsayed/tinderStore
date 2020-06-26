//
//  TopNavigationStackView.swift
//  tinderStore
//
//  Created by Yousef on 6/22/20.
//  Copyright © 2020 Yousef. All rights reserved.
//

import UIKit

class TopNavigationStackView: UIStackView {
    let settingButton = UIButton(type: .system)
    let profileButton = UIButton(type: .system)
    let logoImage = UIImageView(image: #imageLiteral(resourceName: "appIcon"))
    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution = .fillEqually
        logoImage.contentMode = .scaleAspectFit
        heightAnchor.constraint(equalToConstant: 70).isActive = true
        settingButton.setImage(#imageLiteral(resourceName: "topRightMessage").withRenderingMode(.alwaysOriginal), for: .normal)
        profileButton.setImage(#imageLiteral(resourceName: "topLeftProfile").withRenderingMode(.alwaysOriginal), for: .normal)
        [settingButton,UIView(),logoImage,UIView(), profileButton].forEach { (v) in
            addArrangedSubview(v)
        }
        distribution = .equalCentering
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 0, left: 12, bottom: 0, right: 12)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
