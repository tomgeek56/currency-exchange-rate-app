//
//  ModalPresentAnimationController.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 14/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import Foundation
import UIKit

class FlipPresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
   private let originFrame: CGRect
    
    init(originFrame: CGRect) {
      self.originFrame = originFrame
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
      return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
      
      guard let fromVC = transitionContext.viewController(forKey: .from),
        let toVC = transitionContext.viewController(forKey: .to),
        let snapshot = toVC.view.snapshotView(afterScreenUpdates: true)
        else {
          return
      }
      
      let containerView = transitionContext.containerView
      let finalFrame = transitionContext.finalFrame(for: toVC)
      
      snapshot.frame = originFrame
      snapshot.layer.cornerRadius = 8
      snapshot.layer.masksToBounds = true
      
      containerView.addSubview(toVC.view)
      containerView.addSubview(snapshot)
      toVC.view.isHidden = true
      
      AnimationHelper.perspectiveTransform(for: containerView)
      snapshot.layer.transform = AnimationHelper.yRotation(.pi / 2)
      let duration = transitionDuration(using: transitionContext)
      
      UIView.animateKeyframes(
        withDuration: duration,
        delay: 0,
        options: .calculationModeCubic,
        animations: {
          UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1/3) {
            fromVC.view.layer.transform = AnimationHelper.yRotation(-.pi / 2)
          }
          
          UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3) {
            snapshot.layer.transform = AnimationHelper.yRotation(0.0)
          }
          
          UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3) {
            snapshot.frame = finalFrame
            snapshot.layer.cornerRadius = 0
          }
      },
        completion: { _ in
          toVC.view.isHidden = false
          snapshot.removeFromSuperview()
          fromVC.view.layer.transform = CATransform3DIdentity
          transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
      })
    }
    
}
