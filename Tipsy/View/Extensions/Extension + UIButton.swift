//
//  Extension + UIButton.swift
//  Tipsy
//
//  Created by Igor Guryan on 27.11.2023.
//

import UIKit

extension UIButton {
    convenience init(text: String?, tintColor: UIColor, target: Any?, action: Selector? ) {
        self.init()
        
        if let target = target, let action = action {
            addTarget(target, action: action, for: .touchUpInside)
        }
        if let text = text {
            setTitle(text, for: .normal)
        }
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
//        layer.shadowOpacity = 0.5
//        layer.shadowRadius = 1.0
        self.tintColor = tintColor
        self.isEnabled = true
        self.titleLabel?.font = .systemFont(ofSize: 35)
        self.backgroundColor = self.isSelected ? .greenButton : .clear
        self.setTitleColor(.greenButton, for: .normal)
        self.setTitleColor(.customWhite, for: .selected)
        self.titleLabel?.textColor = .greenButton
        
//        self.textColor = textColor
//        self.backgroundColor = backgroundColor
        translatesAutoresizingMaskIntoConstraints = false
    }
}
