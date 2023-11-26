//
//  ViewController.swift
//  Tipsy
//
//  Created by Igor Guryan on 25.11.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
// -MARK: TopStack UI
    
    private lazy var topStackView: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 26
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var enterBillTotalLabel = UILabel(
        text: "Enter bill total",
        font: .systemFont(ofSize: 25)
    )
    
    private lazy var billTextField: UITextField = {
        var textField = UITextField()
        textField.textColor = UIColor(named: "greenButtonColor")
        textField.placeholder = "e.g. 123.56"
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 40)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    // -MARK: GreenView UI
    
    private lazy var greenBottomView: UIView = {
        var view = UIView()
        view.backgroundColor = .lightGreenBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var bigSelectorStack: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 26
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var selectTipLabel =  UILabel(
        text: "Select tip",
        font: .systemFont(ofSize: 25)
    )
    
    private lazy var pctButtonsStack: UIStackView = {
        var stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    
    // -MARK: View Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        view.addSubview(greenBottomView)
        view.addSubview(topStackView)
        topStackView.addArrangedSubview(enterBillTotalLabel)
        topStackView.addArrangedSubview(billTextField)
        greenBottomView.addSubview(bigSelectorStack)
        bigSelectorStack.addArrangedSubview(selectTipLabel)
        bigSelectorStack.addArrangedSubview(pctButtonsStack)
    }
    
    private func setupConstraints() {
        topStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            make.width.equalToSuperview()
        }
        
        enterBillTotalLabel.snp.makeConstraints{ make in
            make.height.equalTo(30)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
        }
        
        billTextField.snp.makeConstraints{ make in
            make.height.equalTo(48)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            
        }
        
        greenBottomView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(topStackView.snp.bottom).offset(40)
        }
        
        bigSelectorStack.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(20)
        }
        
        selectTipLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        
        pctButtonsStack.snp.makeConstraints{ make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        
        
    }
}

#Preview { ViewController() }
