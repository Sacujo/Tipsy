//
//  ViewController.swift
//  Tipsy
//
//  Created by Igor Guryan on 25.11.2023.
//

import UIKit
import SnapKit

class CalculateViewController: UIViewController {
    
    // -MARK: TopStack UI
    
    private var persent: Float = 0.1
    
    private lazy var topStackView = UIStackView(
        axis: .vertical,
        alignment: .center,
        distribution: .fill,
        spacing: 26,
        subview: [
            enterBillTotalLabel,
            billTextField
        ]
    )
    
    
    private lazy var enterBillTotalLabel = UILabel(
        text: "Enter bill total",
        font: .systemFont(ofSize: 25)
    )
    
    private lazy var billTextField: UITextField = {
        var textField = UITextField()
        textField.textColor = .greenButton
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
    
    private lazy var bigSelectorStack = UIStackView(
        axis: .vertical,
        alignment: .center,
        distribution: .fill,
        spacing: 26,
        subview: [
            selectTipLabel,
            pctButtonsStack,
            chooseSplitLabel,
            splitNumberStack
        ]
    )
    
    private lazy var selectTipLabel =  UILabel(
        text: "Select tip",
        font: .systemFont(ofSize: 25)
    )
    
    private lazy var pctButtonsStack = UIStackView(
        axis: .horizontal,
        alignment: .fill,
        distribution: .fillProportionally,
        spacing: 0,
        subview: [
            zeroPctButton,
            tenPctButton,
            twentyPctButton
        ]
    )
    
    private lazy var zeroPctButton: UIButton = {
        var button = UIButton(
            text: "0%",
            tintColor: .clear,
            target: self,
            action: #selector(tipChanged)
        )
        button.backgroundColor = .clear
        button.setTitleColor(.greenButton, for: .normal)
        button.setTitleColor(.customWhite, for: .selected)
        button.titleLabel?.textColor = .black
        button.layer.cornerRadius = 10
        return button
        
    }()
    
    private lazy var tenPctButton: UIButton = {
        var button = UIButton(
            text: "10%",
            tintColor: .clear,
            target: self,
            action: #selector(tipChanged)
        )
        button.backgroundColor = .greenButton
        button.isSelected = true
        button.titleLabel?.textColor = .black
        button.layer.cornerRadius = 10
        return button
        
    }()
    
    private lazy var twentyPctButton: UIButton = {
        var button = UIButton(
            text: "20%",
            tintColor: .clear,
            target: self,
            action: #selector(tipChanged)
        )
        button.backgroundColor = .clear
        button.setTitleColor(.greenButton, for: .normal)
        button.setTitleColor(.customWhite, for: .selected)
        button.titleLabel?.textColor = .black
        button.layer.cornerRadius = 10
        return button
        
    }()
    
    
    private lazy var chooseSplitLabel = UILabel(
        text: "Choose Split",
        font: .systemFont(ofSize: 25)
    )
    
    private lazy var splitNumberStack = UIStackView(
        axis: .horizontal,
        alignment: .fill,
        distribution: .fill,
        spacing: 27,
        subview: [
            splitNumberLabel,
            splitNumberStepper
        ]
    )
    
    private lazy var splitNumberLabel: UILabel = {
        var label = UILabel(
            text: "2",
            font: .systemFont(ofSize: 35)
        )
        label.textColor = .greenButton
        return label
    }()
    
    private lazy var splitNumberStepper: UIStepper = {
        var stepper = UIStepper()
        stepper.value = 2
        stepper.minimumValue = 2
        stepper.maximumValue = 25
        stepper.stepValue = 1
        stepper.autorepeat = true
        stepper.isContinuous = true
        stepper.addTarget(self, action: #selector(stepperValueChanged), for: .touchUpInside)
        return stepper
        
    }()
    
    private lazy var calculateButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .greenButton
        button.setTitle("Calculate", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
// -MARK: Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
}
    
    
    

// -MARK: SetupView

private extension CalculateViewController {
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(greenBottomView)
        view.addSubview(topStackView)
        greenBottomView.addSubview(bigSelectorStack)
        greenBottomView.addSubview(calculateButton)
        setupConstraints()
    }
}

// -MARK: Layout

private extension CalculateViewController {
    
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
            make.trailing.equalToSuperview().offset(-20)
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
        
        zeroPctButton.snp.makeConstraints{ make in
            make.width.greaterThanOrEqualTo(60)
            make.height.equalTo(54)
        }
        
        tenPctButton.snp.makeConstraints{ make in
            make.height.equalTo(54)
            make.width.equalTo(zeroPctButton.snp.width)
        }
        
        twentyPctButton.snp.makeConstraints{ make in
            make.height.equalTo(54)
            make.width.equalTo(zeroPctButton.snp.width)
        }
        
        chooseSplitLabel.snp.makeConstraints{ make in
            make.height.equalTo(30)
            make.trailing.equalToSuperview().offset(-30)
            make.leading.equalToSuperview().offset(30)
        }
        
        splitNumberLabel.snp.makeConstraints{ make in
            make.width.equalTo(93)
            make.height.equalTo(29)
        }
        
        splitNumberStepper.snp.makeConstraints{ make in
            make.width.equalTo(94)
            make.height.equalTo(29)
        }
        
        calculateButton.snp.makeConstraints{ make in
            make.width.greaterThanOrEqualTo(200)
            make.height.equalTo(54)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            
        }
        
    }
    
}

// -MARK: Methods

private extension CalculateViewController{
    @objc func tipChanged(sender: UIButton) {
        for button in [zeroPctButton, tenPctButton, twentyPctButton] {
            if button == sender {
                button.backgroundColor = .greenButton
                button.isSelected = true
                persent = Float(button.currentTitle!.dropLast())! / 100
            } else {
                button.backgroundColor = .clear
                button.isSelected = false
            }
        }
    }
    
    @objc func stepperValueChanged() {
        splitNumberLabel.text = String(Int(splitNumberStepper.value))
        
    }
    
    
    
    @objc func calculateButtonTapped() {
        let calculatedResault = (Float(billTextField.text ?? "0")! + Float(billTextField.text ?? "0")! * persent) / Float(splitNumberStepper.value)
        let vc = ResultViewController()
        vc.setResults(String(calculatedResault), Int(self.persent * 100) ,Int(self.splitNumberStepper.value))
        present(vc, animated: true)
        }
    }
#Preview { CalculateViewController() }
