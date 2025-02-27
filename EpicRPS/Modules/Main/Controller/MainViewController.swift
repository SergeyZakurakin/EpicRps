//
//  MainViewController.swift
//  EpicRPS
//
//  Created by Evgenii Mazrukho on 10.06.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    
    // MARK: - UI
    private lazy var buttonStackView: UIStackView = {
        let element = UIStackView()
        element.distribution = .fillEqually
        element.axis = .vertical
        element.alignment = .center
        element.spacing = 10
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var maleHandImageView: UIImageView = {
        let element = UIImageView()
        element.image = .mainMaleHand
        element.contentMode = .scaleAspectFit
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var femaleHandImageView: UIImageView = {
        let element = UIImageView()
        element.image = .mainFemaleHand
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var mainTitleLabel = UILabel(textColor: .brownLight)
    private lazy var shadowTitleLabel = UILabel(textColor: .brownDarker)
    
    private lazy var startButton = UIButton(textLabel: "START")
    private lazy var resultButton = UIButton(textLabel: "RESULT")
    
    
    // MARK: - Private methods
    @objc private func startButtonPressed(_ sender: UIButton) {
        print("START")
        let gameVC = GameViewController()
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    @objc private func resultButtonPressed(_ sender: UIButton) {
        print("RESULT")
        let statisticVC = StatisticsViewController()
        navigationController?.pushViewController(statisticVC, animated: true)
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraint()
        setupNavBar(on: self, title: nil, leftImage: .settings, leftSelector: #selector(goToSettingsVC), rightImage: .rules, rightSelector: #selector(goToRulesVC))
    }
}

// MARK: - Setup View and Setup Constraint
extension MainViewController {
    
    private func setupView() {
        view.backgroundColor = .greyWhite
        
        view.addSubview(shadowTitleLabel)
        view.addSubview(mainTitleLabel)
        view.addSubview(maleHandImageView)
        view.addSubview(femaleHandImageView)
        view.addSubview(buttonStackView)
        
        buttonStackView.addArrangedSubview(startButton)
        buttonStackView.addArrangedSubview(resultButton)
        
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        resultButton.addTarget(self, action: #selector(resultButtonPressed), for: .touchUpInside)
    }
    
    @objc private func goToRulesVC() {
        let vc = RulesViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func goToSettingsVC() {
        let vc = SettingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            
            startButton.leadingAnchor.constraint(equalTo: buttonStackView.leadingAnchor),
            startButton.trailingAnchor.constraint(equalTo: buttonStackView.trailingAnchor),
            
            resultButton.heightAnchor.constraint(equalToConstant: 53),
            resultButton.leadingAnchor.constraint(equalTo: buttonStackView.leadingAnchor),
            resultButton.trailingAnchor.constraint(equalTo: buttonStackView.trailingAnchor),
            
            mainTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainTitleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            shadowTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 2),
            shadowTitleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 2),
            
            maleHandImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            maleHandImageView.bottomAnchor.constraint(equalTo: mainTitleLabel.topAnchor, constant: -60),
            
            femaleHandImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            femaleHandImageView.topAnchor.constraint(equalTo: mainTitleLabel.bottomAnchor, constant: 60),
        ])
    }
}
