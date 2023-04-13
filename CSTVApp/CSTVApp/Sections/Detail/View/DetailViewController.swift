//
//  DetailViewController.swift
//  CSTVApp
//
//  Created by Felipe Santolim on 12/04/23.
//

import Foundation
import UIKit

class DetailViewController: UIViewController, Presentable {
    
    // MARK: - Properties
    
    private let viewModel: DetailViewModelProtocol
    weak var coordinator: FeedCoordinatorProtocol?
    
    private lazy var feedView: FeedView = {
        let view = FeedView()
//        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public init(viewModel: DetailViewModelProtocol, coordinator: FeedCoordinatorProtocol) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
        
        title = ""
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    
    // MARK: - Private functions
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(feedView)
        NSLayoutConstraint.activate([
            feedView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            feedView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            feedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            feedView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func bind() {
        viewModel.model.bind { [weak self] model in
            self?.feedView.model = model
        }
    }
}
