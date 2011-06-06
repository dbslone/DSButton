//
//  DSButton.h
//  punndit
//
//  Created by David Slone on 5/16/11.
//  Copyright 2011 pxlsinmotion LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSButton : UIButton {
@private
    BOOL _expanded;
    UILabel *_titleLabel;
    CGRect _frameExpanded;
    CGRect _frameShrunk;
    CGFloat _buttonWidth;
    NSInteger _selectedItem;
    NSArray *_labels;
    
    
    // Measurements
    CGFloat width;
    CGFloat frameHeight;
    CGFloat titleXOrigin;
    CGFloat titleYOrigin;
    CGFloat titleHeight;
    CGFloat titleWidth;
    CGFloat buttonHeight;
    CGFloat labelHeight;
    CGFloat labelXOrigin;
    CGFloat labelYOrigin;
    CGFloat defaultButtonWidth;
    CGFloat fontSize;
    
    // HUD Appearance
    CGFloat layerWhite;
    CGFloat layerAlpha;
    CGFloat borderWhite;
    CGFloat borderAlpha;
    CGFloat borderWidth;
}

- (void)initVariables;
- (id)initWithPoint:(CGPoint)point title:(NSString *)title buttonNames:(NSArray *)buttonNames selectedItem:(NSInteger)selectedItem buttonWidth:(CGFloat)butonWidth;
- (id)initWithPoint:(CGPoint)point title:(NSString *)title buttonNames:(NSArray *)buttonNames selectedItem:(NSInteger)selectedItem buttonImage:(NSString *)buttonImage;
- (id)initWithPoint:(CGPoint)point title:(NSString *)title buttonNames:(NSArray *)buttonNames selectedItem:(NSInteger)selectedItem;
- (id)initWithPoint:(CGPoint)point title:(NSString *)title buttonNames:(NSArray *)buttonNames;
- (id)initWithPoint:(CGPoint)point buttonImage:(NSString *)buttonImage buttonWidth:(CGFloat)buttonWidth;

@property (nonatomic,readonly,retain) UILabel *titleLabel;
@property (nonatomic,readonly,retain) NSArray *labels;
@property (nonatomic,assign) NSInteger selectedItem;

@end
