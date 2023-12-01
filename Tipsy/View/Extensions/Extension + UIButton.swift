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
        self.tintColor = tintColor
        self.isEnabled = true
        self.titleLabel?.font = .systemFont(ofSize: 35)
        self.backgroundColor = self.isSelected ? .greenButton : .clear
        self.setTitleColor(.greenButton, for: .normal)
        self.setTitleColor(.customWhite, for: .selected)
        self.titleLabel?.textColor = .greenButton
        translatesAutoresizingMaskIntoConstraints = false
    }
}
