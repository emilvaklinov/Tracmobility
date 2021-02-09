//
//  GmailButton.swift
//  Tracmobility
//
//  Created by Emil Vaklinov on 09/02/2021.
//

import UIKit

class GmailButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    
    private func configure() {
        layer.cornerRadius = 14
        layer.borderWidth = 1
    }

}
