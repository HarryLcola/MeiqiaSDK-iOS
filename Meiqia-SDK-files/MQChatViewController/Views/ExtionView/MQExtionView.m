//
//  MQExtionView.m
//  Meiqia-SDK-Demo
//
//  Created by 黄启博 on 2021/6/18.
//  Copyright © 2021 Meiqia. All rights reserved.
//

#import "MQExtionView.h"
#import "MQAssetUtil.h"

@implementation MQExtionView


- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    _photoesLabel.text = @"相册";
    _photoesLabel.textColor = UIColor.blackColor;
    _photoesLabel.font = [UIFont systemFontOfSize:14];
    _cameraLabel.text = @"相册";
    _cameraLabel.textColor = UIColor.blackColor;
    _cameraLabel.font = [UIFont systemFontOfSize:14];
    
    [_photoesImageView setImage: [MQAssetUtil imageFromBundleWithName: @"photoAlbumIcon"]];
    [_cameraImageView setImage: [MQAssetUtil imageFromBundleWithName: @"takeCamera"]];
}
@end
