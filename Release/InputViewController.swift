//
//  InputViewController.swift
//  Release
//
//  Created by Lisa Steele on 9/26/18.
//  Copyright © 2018 Lisa Steele. All rights reserved.
//

import UIKit
import UIKit.UIGestureRecognizerSubclass

private enum State {
    case closed
    case open
}

extension State {
    var opposite: State {
        switch self {
        case .open: return .closed
        case .closed: return .open
        }
    }
}

class InputViewController: UIViewController, UITextViewDelegate {

    @IBOutlet var inputTextView: UITextView!
    var textInputPassed = String()
    
    let stackView = UIStackView()
    let scratch = UIButton()
    let pop = UIButton()
    let swipe = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextView.delegate = self
        inputTextView.returnKeyType = .done
        
        //Popup Animation
        layout()
        popupView.addGestureRecognizer(panRecognizer)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "SegueToAction") {
            //pass the textfield input to the next view
            let pointer = segue.destination as! ActionViewController
            pointer.textInputPassed = self.textInputPassed
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        inputTextView.text = nil
    }
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == self.inputTextView {
            self.textInputPassed = inputTextView.text
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            inputTextView.resignFirstResponder()
            return false
        }
        return true
    }
    
    //Popup Animation
    private let popupOffset: CGFloat = 440
    
    private lazy var popupView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 10
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var closedTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "I'm ready to let it go!"
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        label.textColor = UIColor.darkGray
        label.textAlignment = .center
        return label
    }()
    
    private lazy var openTitleLabel: UILabel = {
        let label = UILabel()
        label.text  = "How do you want to release this anxiety?"
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        label.textColor = UIColor.darkGray
        label.textAlignment = .center
        label.alpha = 0
        label.transform = CGAffineTransform(scaleX: 1.6, y: 1.6).concatenating(CGAffineTransform(translationX: 0, y: 15))
        return label
    }()
    
    private lazy var reviewsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "LabelBackground")
        return imageView
    }()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //Layout
    private var bottomConstraint = NSLayoutConstraint()
    
    private func layout() {
        
        popupView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(popupView)
        popupView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        popupView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomConstraint = popupView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: popupOffset)
        bottomConstraint.isActive = true
        popupView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        closedTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        popupView.addSubview(closedTitleLabel)
        closedTitleLabel.leadingAnchor.constraint(equalTo: popupView.leadingAnchor).isActive = true
        closedTitleLabel.trailingAnchor.constraint(equalTo: popupView.trailingAnchor).isActive = true
        closedTitleLabel.topAnchor.constraint(equalTo: popupView.topAnchor, constant: 20).isActive = true
        
        openTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        popupView.addSubview(openTitleLabel)
        openTitleLabel.leadingAnchor.constraint(equalTo: popupView.leadingAnchor).isActive = true
        openTitleLabel.trailingAnchor.constraint(equalTo: popupView.trailingAnchor).isActive = true
        openTitleLabel.topAnchor.constraint(equalTo: popupView.topAnchor, constant: 20).isActive = true
        
        reviewsImageView.translatesAutoresizingMaskIntoConstraints = false
        popupView.addSubview(reviewsImageView)
        reviewsImageView.leadingAnchor.constraint(equalTo: popupView.leadingAnchor).isActive = true
        reviewsImageView.trailingAnchor.constraint(equalTo: popupView.trailingAnchor).isActive = true
        reviewsImageView.bottomAnchor.constraint(equalTo: popupView.bottomAnchor).isActive = true
        reviewsImageView.heightAnchor.constraint(equalToConstant: 428).isActive = true
        
        let heightConstraintScratch = scratch.heightAnchor.constraint(equalToConstant: 135)
        heightConstraintScratch.isActive = true
        heightConstraintScratch.priority = UILayoutPriority(rawValue: 999)
        scratch.translatesAutoresizingMaskIntoConstraints = false
        self.scratch.addTarget(self, action: #selector(self.scratchTapped(sender:)), for: .touchDown)
        scratch.setTitle("Scratch", for: .normal)
        scratch.setTitleColor(UIColor.darkGray, for: .normal)
        scratch.backgroundColor = UIColor.clear
        
        self.reviewsImageView.addSubview(scratch)
        
        let heightConstraintPop = pop.heightAnchor.constraint(equalToConstant: 135)
        heightConstraintPop.isActive = true
        heightConstraintPop.priority = UILayoutPriority(rawValue: 999)
        pop.translatesAutoresizingMaskIntoConstraints = false
        
        pop.setTitle("Pop", for: .normal)
        pop.setTitleColor(UIColor.darkGray, for: .normal)
        pop.backgroundColor = UIColor.clear
        //pop.addTarget(self, action: #selector(performSegue(withIdentifier:sender:"")), for: .touchUpInside)
        self.reviewsImageView.addSubview(pop)
        
        let heightConstraintSwipe = swipe.heightAnchor.constraint(equalToConstant: 135)
        heightConstraintSwipe.isActive = true
        heightConstraintSwipe.priority = UILayoutPriority(rawValue: 999)
        swipe.translatesAutoresizingMaskIntoConstraints = false
        
        swipe.setTitle("Swipe", for: .normal)
        swipe.setTitleColor(UIColor.darkGray, for: .normal)
        swipe.backgroundColor = UIColor.clear
        //swipe.addTarget(self, action: #selector(performSegue(withIdentifier:sender:"")), for: .touchUpInside)
        self.reviewsImageView.addSubview(swipe)
        
        reviewsImageView.addSubview(stackView)
        stackView.backgroundColor = UIColor.clear
        
        stackView.addArrangedSubview(scratch)
        stackView.addArrangedSubview(pop)
        stackView.addArrangedSubview(swipe)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: popupView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: popupView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: popupView.bottomAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 428).isActive = true
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
    }
    
    @objc func scratchTapped(sender: UIButton) {
        print ("test")
    }
    
    
    //Animation
    
    private var currentState: State = .closed
    
    private var runningAnimators = [UIViewPropertyAnimator]()
    
    private var animationProgress = [CGFloat]()
    
    private lazy var panRecognizer: InstantPanGestureRecognizer = {
        let recognizer = InstantPanGestureRecognizer()
        recognizer.addTarget(self, action: #selector(popupViewPanned(recognizer:)))
        return recognizer
    }()
    
    private func animateTransitionIfNeeded(to state: State, duration: TimeInterval) {
        
        guard runningAnimators.isEmpty else { return }
        
        let transitionAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1, animations: {
            switch state {
            case .open:
                print ("open")
                self.bottomConstraint.constant = 0
                self.popupView.layer.cornerRadius = 20
                self.closedTitleLabel.transform = CGAffineTransform(scaleX: 1.6, y: 1.6).concatenating(CGAffineTransform(translationX: 0, y: 15))
                self.openTitleLabel.transform = .identity
                UIViewAnimationOption.AllowUserInteration = 1 << 1
            case .closed:
                print ("closed") 
                self.bottomConstraint.constant = self.popupOffset
                self.popupView.layer.cornerRadius = 20
                self.openTitleLabel.transform = CGAffineTransform(scaleX: 1.6, y: 1.6).concatenating(CGAffineTransform(translationX: 0, y: 15))
                self.closedTitleLabel.transform = .identity
            }
            self.view.layoutIfNeeded()
        })
        transitionAnimator.addCompletion { position in
            //start and end refer to the animation starting and ending
            switch position {
            case .start:
                self.currentState = state.opposite
            case .end:
                self.currentState = state
            case .current:
                ()
                //self.currentState = state.opposite
            }
            switch self.currentState {
            //This refers to whether it is open or closed, but doesn't make one or the other happen
            case .open:
                self.bottomConstraint.constant = 0
                self.closedTitleLabel.alpha = 0
                self.stopAnimation(true)
                self.scratch.addTarget(self, action: #selector(self.scratchTapped(sender:)), for: .touchDown)
            case .closed:
                self.bottomConstraint.constant = self.popupOffset
                self.openTitleLabel.alpha = 0
            }
            self.runningAnimators.removeAll()
        }
        let inTitleAnimator = UIViewPropertyAnimator(duration: duration, curve: .easeIn, animations: {
            switch state {
            case .open:
                self.openTitleLabel.alpha = 1
            case .closed:
                self.closedTitleLabel.alpha =  1
            }
        })
        inTitleAnimator.scrubsLinearly = false

        let outTitleAnimator = UIViewPropertyAnimator(duration: duration, curve: .easeOut, animations: {
            switch state {
            case.closed:
                self.openTitleLabel.alpha = 1
            case .open:
                self.closedTitleLabel.alpha = 0
            }
        })
        outTitleAnimator.scrubsLinearly = false
        
        transitionAnimator.startAnimation()
        inTitleAnimator.startAnimation()
        outTitleAnimator.startAnimation()
        
        runningAnimators.append(transitionAnimator)
        runningAnimators.append(inTitleAnimator)
        runningAnimators.append(outTitleAnimator)
    }
    
    func stopAnimation(_ withoutFinishing: Bool) {
    }
    
    @objc private func popupViewPanned(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            //This handles both the open and close animation
            animateTransitionIfNeeded(to: currentState.opposite, duration: 1.5)
            runningAnimators.forEach { $0.pauseAnimation() }
            animationProgress = runningAnimators.map { $0.fractionComplete }
        case .changed:
            //This is for when the user stops the open animation midway and pans the popup back down the screen.
            let translation = recognizer.translation(in: popupView)
            var fraction = -translation.y / popupOffset
            if currentState == .open { fraction *= -1 }
            if runningAnimators[0].isReversed { fraction *= -1 }
            
            for (index, animator) in runningAnimators.enumerated() {
                animator.fractionComplete = fraction + animationProgress[index]
            }
        case .ended:
            let yVelocity = recognizer.velocity(in: popupView).y
            let shouldClose = yVelocity > 0
            if yVelocity == 0 {
                runningAnimators.forEach { $0.continueAnimation(withTimingParameters: nil, durationFactor: 0) }
                break
            }
            
            switch currentState {
            case .open:
                if !shouldClose && !runningAnimators[0].isReversed { runningAnimators.forEach { $0.isReversed = !$0.isReversed } }
                if shouldClose && runningAnimators[0].isReversed { runningAnimators.forEach { $0.isReversed = !$0.isReversed } }
            case .closed:
                if shouldClose && !runningAnimators[0].isReversed { runningAnimators.forEach { $0.isReversed = !$0.isReversed } }
                if !shouldClose && runningAnimators[0].isReversed { runningAnimators.forEach { $0.isReversed = !$0.isReversed } }
            }
            runningAnimators.forEach { $0.continueAnimation(withTimingParameters: nil, durationFactor: 0) }
        default:
            ()
        }
    }
}

class InstantPanGestureRecognizer: UIPanGestureRecognizer {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        if (self.state == UIGestureRecognizerState.began) { return }
        super.touchesBegan(touches, with: event)
        self.state = UIGestureRecognizerState.began
    }
}
    



