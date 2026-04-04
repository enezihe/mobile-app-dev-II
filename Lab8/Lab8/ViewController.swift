import UIKit

class ViewController: UIViewController {

    // MARK: - State
    private var output: Int = 0
    private var step: Int = 2

    // MARK: - UI Elements
    private let outputLabel = UILabel()
    private let subtractButton = UIButton(type: .system)
    private let addButton = UIButton(type: .system)
    private let resetButton = UIButton(type: .system)
    private let stepButton = UIButton(type: .system)
    private let logoImageView = UIImageView()
    private let cardView = UIView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupCard()
        setupLogo()
        setupOutputLabel()
        setupActionButtons()
        setupBottomButtons()
        setupTitle()
        updateUI()
    }

    // MARK: - Setup
    private func setupTitle() {
        let titleLabel = UILabel()
        titleLabel.text = "Lab Exercise"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }

    private func setupCard() {
        cardView.backgroundColor = UIColor(red: 0.98, green: 0.90, blue: 0.65, alpha: 1)
        cardView.layer.cornerRadius = 28
        cardView.layer.masksToBounds = true
        cardView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardView)
        NSLayoutConstraint.activate([
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            cardView.widthAnchor.constraint(equalToConstant: 300),
            cardView.heightAnchor.constraint(equalToConstant: 420)
        ])
    }

    private func setupLogo() {
        logoImageView.image = UIImage(named: "gbc_logo")
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.accessibilityLabel = "App Logo"
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
            logoImageView.widthAnchor.constraint(equalToConstant: 160),
            logoImageView.heightAnchor.constraint(equalToConstant: 90)
        ])
    }

    private func setupOutputLabel() {
        outputLabel.text = "0"
        outputLabel.font = UIFont.boldSystemFont(ofSize: 36)
        outputLabel.textAlignment = .center
        outputLabel.backgroundColor = .white
        outputLabel.layer.cornerRadius = 8
        outputLabel.layer.masksToBounds = true
        outputLabel.layer.borderColor = UIColor.black.withAlphaComponent(0.15).cgColor
        outputLabel.layer.borderWidth = 1
        outputLabel.accessibilityLabel = "Output"
        outputLabel.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(outputLabel)
        NSLayoutConstraint.activate([
            outputLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            outputLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 18),
            outputLabel.widthAnchor.constraint(equalToConstant: 140),
            outputLabel.heightAnchor.constraint(equalToConstant: 55)
        ])
    }

    private func setupActionButtons() {
        // Subtract
        subtractButton.setTitle("-", for: .normal)
        subtractButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        subtractButton.backgroundColor = UIColor.gray.withAlphaComponent(0.55)
        subtractButton.setTitleColor(.black, for: .normal)
        subtractButton.layer.cornerRadius = 6
        subtractButton.accessibilityLabel = "Subtract Button"
        subtractButton.addTarget(self, action: #selector(subtractTapped), for: .touchUpInside)
        subtractButton.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(subtractButton)

        // Add
        addButton.setTitle("+", for: .normal)
        addButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        addButton.backgroundColor = UIColor.gray.withAlphaComponent(0.55)
        addButton.setTitleColor(.black, for: .normal)
        addButton.layer.cornerRadius = 6
        addButton.accessibilityLabel = "Add Button"
        addButton.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(addButton)

        NSLayoutConstraint.activate([
            subtractButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 22),
            subtractButton.topAnchor.constraint(equalTo: outputLabel.bottomAnchor, constant: 22),
            subtractButton.widthAnchor.constraint(equalToConstant: 95),
            subtractButton.heightAnchor.constraint(equalToConstant: 52),

            addButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -22),
            addButton.topAnchor.constraint(equalTo: outputLabel.bottomAnchor, constant: 22),
            addButton.widthAnchor.constraint(equalToConstant: 95),
            addButton.heightAnchor.constraint(equalToConstant: 52)
        ])
    }

    private func setupBottomButtons() {
        // Reset
        resetButton.setTitle("Reset", for: .normal)
        resetButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        resetButton.backgroundColor = .systemGreen
        resetButton.setTitleColor(.white, for: .normal)
        resetButton.layer.cornerRadius = 6
        resetButton.accessibilityLabel = "Reset Button"
        resetButton.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(resetButton)

        // Step
        stepButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        stepButton.backgroundColor = .systemOrange
        stepButton.setTitleColor(.white, for: .normal)
        stepButton.layer.cornerRadius = 6
        stepButton.accessibilityLabel = "Step Button"
        stepButton.addTarget(self, action: #selector(stepTapped), for: .touchUpInside)
        stepButton.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(stepButton)

        NSLayoutConstraint.activate([
            resetButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 22),
            resetButton.topAnchor.constraint(equalTo: subtractButton.bottomAnchor, constant: 22),
            resetButton.widthAnchor.constraint(equalToConstant: 95),
            resetButton.heightAnchor.constraint(equalToConstant: 46),

            stepButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -22),
            stepButton.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 22),
            stepButton.widthAnchor.constraint(equalToConstant: 95),
            stepButton.heightAnchor.constraint(equalToConstant: 46)
        ])
    }

    private func updateUI() {
        outputLabel.text = "\(output)"
        stepButton.setTitle("Step = \(step)", for: .normal)
    }

    // MARK: - Actions
    @objc private func addTapped() {
        output += step
        updateUI()
    }

    @objc private func subtractTapped() {
        output -= step
        updateUI()
    }

    @objc private func resetTapped() {
        output = 0
        updateUI()
    }

    @objc private func stepTapped() {
        step = (step == 1) ? 2 : 1
        updateUI()
    }
}
