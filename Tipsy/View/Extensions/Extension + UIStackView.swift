//
//  Extension + UIStackView.swift
//  Tipsy
//
//  Created by Igor Guryan on 27.11.2023.
//

import UIKit

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, alignment:  UIStackView.Alignment, distribution: UIStackView.Distribution, spacing: Int, subview: [UIView]) {
        self.init(arrangedSubviews: subview)
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = CGFloat(spacing)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
