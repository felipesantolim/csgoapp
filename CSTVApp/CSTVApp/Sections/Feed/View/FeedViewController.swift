//
//  ViewController.swift
//  App
//
//  Created by Felipe Santolim on 12/04/23.
//

import UIKit
import Lottie

class FeedViewController: UIViewController, Presentable {
    
    // MARK: - Properties
    
    // 1. Create the LottieAnimationView
    private var animationView: LottieAnimationView?
    
    private let viewModel: FeedViewModelProtocol
    weak var coordinator: FeedCoordinatorProtocol?
    private var currentPg: Int = 1
    private var fetchingMore: Bool = false
    
    private lazy var feedView: FeedView = {
        let view = FeedView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public init(viewModel: FeedViewModelProtocol, coordinator: FeedCoordinatorProtocol) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        setupUI()
        loadUI()
        bind()
    }
    
    // MARK: - Private functions
    
    private func setupUI() {
        view.backgroundColor = UIColor(red: 22/255, green: 22/255, blue: 31/255, alpha: 1)
        view.addSubview(feedView)
        NSLayoutConstraint.activate([
            feedView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            feedView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            feedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            feedView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupNavbar() {
        title = "Matches"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    private func bind() {
        viewModel.model.bind { [weak self] model in
            self?.feedView.model = model
        }
        
        viewModel.loading.bind { [weak self] result in
            guard let result = result else { return }
            if !result {
                DispatchQueue.main.async {
                    self?.animationView?.isHidden = true;
                }
            }
        }
        
        viewModel.fetchAll()
    }
}

extension FeedViewController: FeedViewDelegate {
    
    func didSelect(_ value: MatchModelElement) {
        coordinator?.goToDetail()
    }
    
    func fechMore() {}
}

extension FeedViewController {
    
    private func loadUI() {
        animationView = .init(name: "load")
        animationView?.frame = view.bounds
        animationView?.contentMode = .scaleAspectFit
        animationView?.loopMode = .loop
        animationView?.animationSpeed = 0.5
        
        guard let anim = animationView else { return }
        view.addSubview(anim)
        
        animationView?.play()
    }
}
