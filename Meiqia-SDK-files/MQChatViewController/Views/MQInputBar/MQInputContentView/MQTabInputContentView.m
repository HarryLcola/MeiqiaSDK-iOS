//
//  MCTabInputContentView.m
//  Meiqia
//
//  Created by Injoy on 16/4/14.
//  Copyright © 2016年 Injoy. All rights reserved.
//

#import "MQTabInputContentView.h"
#import "MQBundleUtil.h"
#import "MQAssetUtil.h"

@implementation MQTabInputContentView
{
    CALayer *topBoder;
    UIView *tabBackgroud;
}

-(instancetype)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textField = [[MEIQIA_HPGrowingTextView alloc] initWithFrame:CGRectMake(50, 15, self.frame.size.width - 140, self.frame.size.height)];
        self.textField.placeholder = @"有什么需要帮忙的吗?";

        self.textField.font = [UIFont systemFontOfSize:15];
        self.textField.maxNumberOfLines = 8;
        self.textField.returnKeyType = UIReturnKeySend;
        self.textField.delegate = (id)self;
        self.textField.layer.cornerRadius = self.frame.size.height / 2;
        self.textField.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
        [self addSubview:self.textField];

        topBoder = [CALayer layer];
        topBoder.backgroundColor = [UIColor colorWithRed:198/255.0 green:203/255.0 blue:208/255.0 alpha:1].CGColor;
        [self.layer addSublayer:topBoder];
        
        tabBackgroud = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        tabBackgroud.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:253/255.0 alpha:1];
        [self addSubview:tabBackgroud];
        
        self.microphoneButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 18, 30, 30)];
        [self.microphoneButton setImage: [MQAssetUtil imageFromBundleWithName:@"microphone"] forState: UIControlStateNormal];
        [self addSubview: self.microphoneButton];

        self.extendButton = [[UIButton alloc] initWithFrame:CGRectMake(UIScreen.mainScreen.bounds.size.width - 40, 18, 30, 30)];
        [self.extendButton setImage: [MQAssetUtil imageFromBundleWithName:@"extend"] forState: UIControlStateNormal];
        [self addSubview: self.extendButton];

        self.emojiButton = [[UIButton alloc] initWithFrame:CGRectMake(UIScreen.mainScreen.bounds.size.width - 80, 18, 30, 30)];
        [self.emojiButton setImage: [MQAssetUtil imageFromBundleWithName:@"emoji"] forState: UIControlStateNormal];
        [self addSubview: self.emojiButton];
            
    }
    return self;
}



- (void)setupButtons {
    if (self.delegate && [self.delegate respondsToSelector:@selector(inputContentView:userObjectChange:)]) {
        [self.delegate inputContentView:self userObjectChange:nil];
    }
}

-(void)setNeedsLayout
{
    [super setNeedsLayout];

    topBoder.frame = CGRectMake(0, 0, self.frame.size.width, 1);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(inputContentViewShouldReturn:content:userObject:)])
    {
        return [self.delegate inputContentViewShouldReturn:self content:self.textField.text userObject:nil];
    }
    
    return YES;
}

- (BOOL)isFirstResponder
{
    return self.textField.isFirstResponder;
}

- (BOOL)becomeFirstResponder
{
    return [self.textField becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
    [super resignFirstResponder];
    return [self.textField resignFirstResponder];
}

- (UIView *)inputAccessoryView
{
    return [UIView new];
}

-(void)setInputAccessoryView:(UIView *)inputAccessoryView
{
    self.textField.inputAccessoryView = inputAccessoryView;
}

- (UIView *)inputView
{
    return self.textField.inputView;
}

- (void)setInputView:(UIView *)inputview
{
    self.textField.inputView = inputview;
}

#pragma make - HPGrowingTextViewDelegate
- (void)growingTextView:(MEIQIA_HPGrowingTextView *)growingTextView didChangeHeight:(float)height
{
    if (self.layoutDelegate && [self.layoutDelegate respondsToSelector:@selector(inputContentView:didChangeHeight:)]) {
        [self.layoutDelegate inputContentView:self didChangeHeight:self.textField.frame.size.height];
    }
}

- (void)growingTextView:(MEIQIA_HPGrowingTextView *)growingTextView willChangeHeight:(float)height
{
    if (self.layoutDelegate && [self.layoutDelegate respondsToSelector:@selector(inputContentView:willChangeHeight:)]) {
        [self.layoutDelegate inputContentView:self willChangeHeight:height];
    }
}

- (BOOL)growingTextViewShouldReturn:(MEIQIA_HPGrowingTextView *)growingTextView
{
    if ([growingTextView.text stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet].length > 0) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(inputContentViewShouldReturn:content:userObject:)]) {
            BOOL should = [self.delegate inputContentViewShouldReturn:self content:growingTextView.text userObject:nil];
            if (should) {
                growingTextView.text = @"";
            }
            return should;
        }
    }
    return YES;
}

- (BOOL)growingTextViewShouldBeginEditing:(MEIQIA_HPGrowingTextView *)growingTextView
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(inputContentViewShouldBeginEditing:)]) {
        return [self.delegate inputContentViewShouldBeginEditing:self];
    }else{
        return true;
    }
}

- (void)growingTextViewDidChangeSelection:(MEIQIA_HPGrowingTextView *)growingTextView {
    if ([self.delegate respondsToSelector:@selector(inputContentTextDidChange:)]) {
        [self.delegate inputContentTextDidChange:growingTextView.text];
    }
}


@end
