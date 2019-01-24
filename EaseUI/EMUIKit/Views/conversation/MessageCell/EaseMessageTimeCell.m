/************************************************************
 *  * Hyphenate CONFIDENTIAL
 * __________________
 * Copyright (C) 2016 Hyphenate Inc. All rights reserved.
 *
 * NOTICE: All information contained herein is, and remains
 * the property of Hyphenate Inc.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from Hyphenate Inc.
 */

#import "EaseMessageTimeCell.h"
#import "EaseTransparentBgLabel.h"
#import "UILabel+EaseSize.h"

CGFloat const EaseMessageTimeCellPadding = 5;

@interface EaseMessageTimeCell()

@property (strong, nonatomic) EaseTransparentBgLabel *titleLabel;
@property (strong, nonatomic) NSMutableArray *marginConstraints;

@end

@implementation EaseMessageTimeCell

+ (void)initialize
{
    // UIAppearance Proxy Defaults
    EaseMessageTimeCell *cell = [self appearance];
    cell.titleLabelColor = [UIColor grayColor];
    cell.titleLabelFont = [UIFont systemFontOfSize:12];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self _setupSubview];
    }
    
    return self;
}

#pragma mark - setup subviews

- (void)_setupSubview
{
    _titleLabel = [[EaseTransparentBgLabel alloc] init];
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.textColor = _titleLabelColor;
    _titleLabel.font = _titleLabelFont;
    _titleLabel.textInsets = UIEdgeInsetsMake(5.f, 6.f, 5.f, 6.f);
    _titleLabel.backgroundColor = [UIColor colorWithRed:229 / 255.0 green:229 / 255.0 blue:229 / 255.0 alpha:1.0];
    _titleLabel.layer.cornerRadius = 6.0f;
    _titleLabel.layer.masksToBounds = YES;
    [self.contentView addSubview:_titleLabel];
    
    [self _setupTitleLabelConstraints];
}

#pragma mark - Setup Constraints

- (void)_setupTitleLabelConstraints
{
    CGFloat timeWidth = [self.title length] == 0 ? 50.0 : [UILabel getWidthByHeight:30 title:self.title font:[UIFont systemFontOfSize:12]];
    
    // top
    NSLayoutConstraint *timeLabelTopConstraint = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:EaseMessageTimeCellPadding];
    [self.marginConstraints addObject:timeLabelTopConstraint];
    
    // bottom
    NSLayoutConstraint *timeLabelBottomConstraint = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-EaseMessageTimeCellPadding];
    [self.marginConstraints addObject:timeLabelBottomConstraint];
    
    // centerX
    NSLayoutConstraint *timeLabelCenterXConstraint = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [self.marginConstraints addObject:timeLabelCenterXConstraint];
    
    // width
    NSLayoutConstraint *timeLabelWidthConstraint = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:timeWidth];
    [self.titleLabel addConstraint:timeLabelWidthConstraint];
    
    [self addConstraints:self.marginConstraints];
}

- (void)_refreshTitleLabelConstraints
{
    for (NSLayoutConstraint *constraint in self.titleLabel.constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeWidth) {
            CGFloat timeWidth = [self.title length] == 0 ? 50.0 : [UILabel getWidthByHeight:30 title:self.title font:[UIFont systemFontOfSize:12]];
            constraint.constant = timeWidth;
            [self.titleLabel setNeedsUpdateConstraints];
            [self.titleLabel updateConstraints];
        }
    }
}

#pragma mark - setter

- (void)setTitle:(NSString *)title
{
    _title = title;
    _titleLabel.text = _title;
    [self _refreshTitleLabelConstraints];
}

- (void)setTitleLabelFont:(UIFont *)titleLabelFont
{
    _titleLabelFont = titleLabelFont;
    _titleLabel.font = _titleLabelFont;
}

- (void)setTitleLabelColor:(UIColor *)titleLabelColor
{
    _titleLabelColor = titleLabelColor;
    _titleLabel.textColor = _titleLabelColor;
}

#pragma mark - getter
- (NSMutableArray *)marginConstraints
{
    if (!_marginConstraints) {
        _marginConstraints = [NSMutableArray array];
    }
    return _marginConstraints;
}

#pragma mark - public

+ (NSString *)cellIdentifier
{
    return @"MessageTimeCell";
}

@end
