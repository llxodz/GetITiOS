//
//  MainViewController.swift
//  GetITiOS
//
//  Created by Ilya Gavrilov on 22.11.2022.
//

import UIKit

class MainViewController: UIViewController {

    private lazy var radarView = RadarView(countCircles: 10, countPlanes: 50)
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        addViews()
        configureLayout()
        configureAppearance()
    }
    
    // MARK: - Private
    
    private func addViews() {
        radarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(radarView)
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            radarView.topAnchor.constraint(equalTo: view.topAnchor),
            radarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            radarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            radarView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func configureAppearance() {
        radarView.backgroundColor = .white
    }
}

