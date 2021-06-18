//
//  MQChatCardView.h
//  Meiqia-SDK-Demo
//
//  Created by 黄启博 on 2021/6/17.
//  Copyright © 2021 Meiqia. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MQChatCardView : UIView
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UIImageView *statusImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;
@property (weak, nonatomic) IBOutlet UIButton *callButton;
@end

NS_ASSUME_NONNULL_END
