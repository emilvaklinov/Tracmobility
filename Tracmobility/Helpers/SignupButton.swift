//
//  SignupButton.swift
//  Tracmobility
//
//  Created by Emil Vaklinov on 09/02/2021.
//

import UIKit

class SignupButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 10
    }

}
