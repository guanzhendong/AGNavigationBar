//
//  AGNavigationBar.swift
//  AGNavigationBar
//
//  Created by arthurguan on 2024/7/18.
//  Copyright © 2024 arthurguan. All rights reserved.
//

import UIKit

protocol AGNavigationBarActionDelegate: NSObjectProtocol {
    
    func actionDidUpdate(_ action: AGNavigationBarAction)
}

extension AGNavigationBarAction {
    
    public enum Position {
        
        case left
        
        case right
    }
    
    public typealias Handler = ((AGNavigationBarAction) -> Void)
}

/// Buttons on the navigation bar
public class AGNavigationBarAction: NSObject {
    
    public var title: String? {
        didSet {
            delegate?.actionDidUpdate(self)
        }
    }
    
    public var image: String? {
        didSet {
            delegate?.actionDidUpdate(self)
        }
    }
    
    private(set) var handler: Handler?
    
    /// The position of the button
    private(set) var position: Position
    
    /// Default is true
    public var isEnabled: Bool = true {
        didSet {
            delegate?.actionDidUpdate(self)
        }
    }
    
    /// Default is false
    public var isHidden: Bool = false {
        didSet {
            delegate?.actionDidUpdate(self)
        }
    }
    
    weak var delegate: AGNavigationBarActionDelegate?
    
    
    init(position p: Position) {
        position = p
    }
    
    public convenience init(title: String?, position: Position, handler: Handler? = nil) {
        self.init(position: position)
        self.title = title
        self.handler = handler
    }
    
    public convenience init(image: String?, position: Position, handler: Handler? = nil) {
        self.init(position: position)
        self.image = image
        self.handler = handler
    }
}


extension AGNavigationBar {
    
    /// Global settings of NavigationBar
    public struct Config {
        
        /// Back image for NavigationBar
        public static var backImage: String?
        
        /// Back action handler for NavigationBar
        public static var backActionHandler: AGNavigationBarAction.Handler?
        
        /// Shadow image for NavigationBar
        public static var shadowImage: UIImage?
        
        /// Background image for NavigationBar
        public static var backgroundImage: UIImage?
        
        /// Background color for NavigationBar
        public static var barTintColor: UIColor = UIColor(white: 237.0/255, alpha: 1.0)
        
        /// Action tint color for NavigationBar, it's AGNavigationBarAction's color, default is white
        public static var actionTintColor: UIColor = .white
        
        /// Action edge margin for NavigationBar, default is 16
        public static var actionEdgeMargin: CGFloat = 16
        
        /// Action spacing for NavigationBar, default is 8
        public static var actionSpacing: CGFloat = 8
        
        /// Action title font for NavigationBar, default is .systemFont(ofSize: 16)
        public static var actionTitleFont: UIFont = .systemFont(ofSize: 16)
        
        /// Title text attributes for NavigationBar, default is [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 18, weight: .medium)]
        public static var titleTextAttributes: [NSAttributedString.Key : Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 18, weight: .medium)
        ]
    }
}

public class AGNavigationBar: UIView {
    
    // MARK: - Public Properties
    
    /// Title for NavigationBar
    public var title: String? {
        didSet {
            guard let lbl = titleView as? UILabel else { return }
            lbl.attributedText = NSAttributedString(string: title ?? "", attributes: titleTextAttributes)
        }
    }
    
    /// Title text attributes for NavigationBar, default is Config.titleTextAttributes
    public var titleTextAttributes: [NSAttributedString.Key : Any]? = Config.titleTextAttributes {
        didSet {
            guard let lbl = titleView as? UILabel else { return }
            lbl.attributedText = NSAttributedString(string: title ?? "", attributes: titleTextAttributes)
        }
    }
    
    /// Background color for NavigationBar
    public var barTintColor: UIColor? {
        didSet {
            visualEffectView.contentView.backgroundColor = barTintColor
        }
    }
    
    /// Action tint color for NavigationBar, it's AGNavigationBarAction's color, default is Config.actionTintColor
    public var actionTintColor: UIColor = Config.actionTintColor {
        didSet {
            leftStackView.arrangedSubviews.forEach { view in
                guard let btn = view as? UIButton else { return }
                changeButtonColor(btn)
            }
            rightStackView.arrangedSubviews.forEach { view in
                guard let btn = view as? UIButton else { return }
                changeButtonColor(btn)
            }
        }
    }
    
    /// Set the back action is hidden, default is false
    public var isBackHidden: Bool = false {
        didSet {
            guard !oldValue, isBackHidden else {
                return
            }
            let action = actions[0]
            action.isHidden = true
        }
    }
    
    
    
    // MARK: - Private Properties
    
    /// Background imageView
    private lazy var backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = Config.backgroundImage
        return iv
    }()
    
    /// Visual effect view
    private lazy var visualEffectView: UIVisualEffectView = {
        let effect: UIBlurEffect
        if #available(iOS 13, *) {
            effect = UIBlurEffect(style: .systemChromeMaterial)
        } else {
            effect = UIBlurEffect(style: .extraLight)
        }
        let ev = UIVisualEffectView(effect: effect)
        ev.contentView.backgroundColor = Config.barTintColor
        return ev
    }()
    
    /// Bottom line
    private lazy var shadowImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = Config.shadowImage
        return iv
    }()
    
    /// Container view where you put your custom view
    private let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    /// Left stackView to add AGNavigationBarActions
    private let leftStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.spacing = Config.actionSpacing
        sv.distribution = .fill
        return sv
    }()
    
    /// Right stackView to add AGNavigationBarActions
    private let rightStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.spacing = Config.actionSpacing
        sv.distribution = .fill
        return sv
    }()
    
    /// Title view in the middle of the NavigationBar
    private let titleView: UIView = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private(set) var actions: [AGNavigationBarAction] = []
    
    
    
    // MARK: - Lifecycle
    
    public override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        if let _ = Config.backgroundImage {
            addSubview(backgroundImageView)
        } else {
            addSubview(visualEffectView)
        }
        if let _ = Config.shadowImage {
            addSubview(shadowImageView)
        }
        addSubview(containerView)
        containerView.addSubview(leftStackView)
        containerView.addSubview(rightStackView)
        containerView.addSubview(titleView)
        
        NSLayoutConstraint.activate([
            leftStackView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: Config.actionEdgeMargin),
            leftStackView.heightAnchor.constraint(equalTo: containerView.heightAnchor),
            
            rightStackView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -Config.actionEdgeMargin),
            rightStackView.heightAnchor.constraint(equalTo: containerView.heightAnchor),
            
            titleView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            titleView.heightAnchor.constraint(equalTo: containerView.heightAnchor),
        ])
        
        // default add back action
        if let backImage = Config.backImage {
            addAction(AGNavigationBarAction(image: backImage, position: .left, handler: Config.backActionHandler))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        visualEffectView.frame = bounds
        backgroundImageView.frame = bounds
        
        var safeAreaTop: CGFloat = 20.0
        if #available(iOS 11, *) {
            safeAreaTop = UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 44.0
        }
        containerView.frame = CGRect(x: 0, y: safeAreaTop, width: bounds.width, height: bounds.height - safeAreaTop)
        
        let lineHeight = 1 / UIScreen.main.scale
        shadowImageView.frame = CGRect(x: 0,
                                       y: bounds.height - lineHeight,
                                       width: bounds.width,
                                       height: lineHeight)
    }
    
    
    
    // MARK: - Public API
    
    /// Add subview to NavigationBar
    public func add(_ subView: UIView) {
        containerView.addSubview(subView)
    }
    
    /// Add action to NavigationBar
    public func addAction(_ action: AGNavigationBarAction) {
        action.delegate = self
        actions.append(action)
        
        let button = UIButton(type: .system)
        button.setTitle(action.title, for: .normal)
        button.titleLabel?.font = Config.actionTitleFont
        button.setImage(UIImage(named: action.image ?? "")?.withRenderingMode(.alwaysOriginal), for: .normal)
        changeButtonColor(button)
        button.isEnabled = action.isEnabled
        button.isHidden = action.isHidden
        button.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
        button.tag = 100 + actions.count
        switch action.position {
        case .left:
            leftStackView.addArrangedSubview(button)
        case .right:
            rightStackView.addArrangedSubview(button)
        }
    }
    
    
    
    // MARK: - Private
    
    @objc private func buttonClicked(_ sender: UIButton) {
        let action = actions[sender.tag - 101]
        action.handler?(action)
    }
    
    private func changeButtonColor(_ button: UIButton) {
        button.setTitleColor(actionTintColor, for: .normal)
        
        guard let img = button.image(for: .normal) else { 
            return
        }
        button.setImage(img.imageByTintColor(actionTintColor)?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
}





extension AGNavigationBar: AGNavigationBarActionDelegate {
    
    func actionDidUpdate(_ action: AGNavigationBarAction) {
        guard let idx = actions.firstIndex(of: action) else { return }
        
        // find the button
        let stackView = action.position == .left ? leftStackView : rightStackView
        guard let button = stackView.arrangedSubviews.first(where: { $0.tag == idx + 101 }) as? UIButton else { return }
        
        button.setTitle(action.title, for: .normal)
        button.setImage(UIImage(named: action.image ?? "")?.imageByTintColor(actionTintColor)?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.isEnabled = action.isEnabled
        button.isHidden = action.isHidden
    }
}

extension UIImage {
    
    fileprivate func imageByTintColor(_ color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        let rect = CGRectMake(0, 0, self.size.width, self.size.height)
        color.set()
        UIRectFill(rect)
        draw(at: CGPointMake(0, 0), blendMode: .destinationIn, alpha: 1)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
