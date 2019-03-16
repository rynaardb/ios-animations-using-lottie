import UIKit
import Lottie

class ViewController: UIViewController {
    let loadingAnimation = LOTAnimationView(name: "loading")

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAnimationView()
        setupButtons()
    }

    private func setupAnimationView() {
        loadingAnimation.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        loadingAnimation.contentMode = .scaleAspectFit
        loadingAnimation.frame = view.bounds
        view.addSubview(loadingAnimation)
    }

    private func setupButtons() {
        let animateButton1: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Animate Once", for: .normal)
            button.backgroundColor = .orange
            button.addTarget(self, action: #selector(animateOnce), for: .touchUpInside)
            button.layer.cornerRadius = 6

            return button
        }()

        view.addSubview(animateButton1)

        NSLayoutConstraint.activate([animateButton1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     animateButton1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                                     animateButton1.widthAnchor.constraint(equalToConstant: 150),
                                     animateButton1.heightAnchor.constraint(equalToConstant: 50)])

        let animateButton2: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Loop", for: .normal)
            button.backgroundColor = .orange
            button.addTarget(self, action: #selector(loopAnimation), for: .touchUpInside)
            button.layer.cornerRadius = 6

            return button
        }()

        view.addSubview(animateButton2)

        NSLayoutConstraint.activate([animateButton2.topAnchor.constraint(equalTo: animateButton1.bottomAnchor, constant: 20),
                                     animateButton2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     animateButton2.widthAnchor.constraint(equalToConstant: 150),
                                     animateButton2.heightAnchor.constraint(equalToConstant: 50)])

        let stopButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Stop", for: .normal)
            button.backgroundColor = .red
            button.addTarget(self, action: #selector(stopAnimation), for: .touchUpInside)
            button.layer.cornerRadius = 6

            return button
        }()

        view.addSubview(stopButton)

        NSLayoutConstraint.activate([stopButton.topAnchor.constraint(equalTo: animateButton2.bottomAnchor, constant: 20),
                                     stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     stopButton.widthAnchor.constraint(equalToConstant: 150),
                                     stopButton.heightAnchor.constraint(equalToConstant: 50)])
    }

    @objc private func animateOnce() {
        loadingAnimation.play { _ in
            print("Animation completed!")
        }
    }

    @objc private func loopAnimation() {
        loadingAnimation.loopAnimation = true

        loadingAnimation.play(fromProgress: 0,
                              toProgress: 0.76,
                              withCompletion: nil)
    }

    @objc private func stopAnimation() {
        loadingAnimation.stop()
    }
}
