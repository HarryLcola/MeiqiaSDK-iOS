//
//  MQChatCardView.m
//  Meiqia-SDK-Demo
//
//  Created by 黄启博 on 2021/6/17.
//  Copyright © 2021 Meiqia. All rights reserved.
//

#import "MQChatCardView.h"
#import "MQAssetUtil.h"

@implementation MQChatCardView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupView];
}

- (void) setupView {
    self.mainView.layer.cornerRadius = 10;
    [self.avatarImageView setImage:[[MQAssetUtil imageFromBundleWithName:@"housekeeper_avatar"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self.callButton setImage:[[MQAssetUtil imageFromBundleWithName:@"phone"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState: UIControlStateNormal];

    
    self.titleLabel.textColor = UIColor.blackColor;
    self.titleLabel.text = @"铁建小管家";
    self.titleLabel.font = [UIFont systemFontOfSize:18];
    
    self.subLabel.textColor = UIColor.grayColor;
    self.subLabel.text = @"铁建大厦物业管理处";
    self.subLabel.font = [UIFont systemFontOfSize:12];

}


@end
