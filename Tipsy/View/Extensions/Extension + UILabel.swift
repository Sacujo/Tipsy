//
//  Extension + UILabel.swift
//  Tipsy
//
//  Created by Igor Guryan on 26.11.2023.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = .grayLabel
        self.textAlignment = .left
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
