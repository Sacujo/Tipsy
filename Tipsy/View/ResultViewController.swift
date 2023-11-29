//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Igor Guryan on 28.11.2023.
//

import UIKit
import SnapKit

class ResultViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupConstraints()
    }
    
    private lazy var greenTopView: UIView = {
        var view = UIView()
        view.backgroundColor = .lightGreenBackground
        return view
    }()
    
    private lazy var totalPerPersonLabel: UILabel = {
        let label = UILabel(
        text: "Total per person",
        font: .systemFont(ofSize: 30)
    )
        label.textAlignment = .center
        return label
    }()
    
    private lazy var calculatedRusultLabel: UILabel = {
        var label = UILabel()
        label.text = "56.32"
        label.font = .boldSystemFont(ofSize: 45)
        label.textColor = .greenButton
        label.textAlignment = .center
        return label
    }()
    
    private lazy var splitBetwinLabel: UILabel = {
        var label = UILabel(
            text: "Split between 2 people, with 10% tip.",
            font: .systemFont(ofSize: 25)
        )
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var recalculateButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .greenButton
        button.setTitle("Recalculate", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        return button
    }()
    
    
    private func setupUI() {
        view.addSubview(greenTopView)
        greenTopView.addSubview(totalPerPersonLabel)
        greenTopView.addSubview(calculatedRusultLabel)
        view.addSubview(splitBetwinLabel)
        view.addSubview(recalculateButton)
    }
    
    private func setupConstraints() {
        greenTopView.snp.makeConstraints{ make in
            make.height.equalTo(300)
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        }
        
        totalPerPersonLabel.snp.makeConstraints{ make in
            make.height.equalTo(36)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        calculatedRusultLabel.snp.makeConstraints{ make in
            make.height.equalTo(100)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(totalPerPersonLabel.snp.bottom)
        }
        
        splitBetwinLabel.snp.makeConstraints { make in
            make.height.equalTo(117)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(50)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-50)
            make.top.equalTo(greenTopView.snp.bottom).offset(5)
        }
        
        recalculateButton.snp.makeConstraints{ make in
            make.width.greaterThanOrEqualTo(200)
            make.height.equalTo(54)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            
        }
    }
    
    
    
}


#Preview { ResultViewController() }

