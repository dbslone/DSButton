//
//  DSButton.m
//  punndit
//
//  Created by David Slone on 5/16/11.
//  Copyright 2011 pxlsinmotion LLC. All rights reserved.
//

#import "DSButton.h"
#import <QuartzCore/QuartzCore.h>


@interface DSButton ()

@property (nonatomic,assign) BOOL expanded;
@property (nonatomic,assign) CGRect frameExpanded;
@property (nonatomic,assign) CGRect frameShrunk;
@property (nonatomic,assign) CGFloat buttonWidth;
@property (nonatomic,retain) UILabel *titleLabel;
@property (nonatomic,retain) NSArray *labels;

@end

@implementation DSButton

@synthesize expanded = _expanded;
@synthesize frameExpanded = _frameExpanded;
@synthesize frameShrunk = _frameShrunk;
@synthesize buttonWidth = _buttonWidth;
@synthesize titleLabel = _titleLabel;
@synthesize labels = _labels;
@dynamic selectedItem;

- (void)initVariables {
    // Measurements
    width = 50.f;
    frameHeight = 32.f;
    titleXOrigin = 8.f;
    titleYOrigin = 9.f;
    titleHeight = 16.f;
    titleWidth = 44.f;
    buttonHeight = 26.f;
    labelHeight = 39.f;
    labelXOrigin = 45.f;
    labelYOrigin = -3.f;
    defaultButtonWidth = 44.f;
    fontSize = 16.f;
    
    // HUD Appearance
    layerWhite = 1.f;
    layerAlpha = .5f;
    borderWhite = .0f;
    borderAlpha = 1.f;
    borderWidth = 1.f;
}

- (id)initWithPoint:(CGPoint)point title:(NSString *)title buttonNames:(NSArray *)buttonNames selectedItem:(NSInteger)selectedItem buttonWidth:(CGFloat)buttonWidth
{
    [self initVariables];
    
    CGRect frameShrunk = CGRectMake(point.x, point.y, width + buttonWidth, frameHeight);
    CGRect frameExpanded = CGRectMake(point.x, point.y, width + buttonWidth * [buttonNames count], frameHeight);
    if ((self = [super initWithFrame:frameShrunk])) {
        [self setFrameShrunk:frameShrunk];
        [self setFrameExpanded:frameExpanded];
        [self setButtonWidth:buttonWidth];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleXOrigin, titleYOrigin, titleWidth, titleHeight)];
        [titleLabel setText:title];
        [titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
        [titleLabel setTextColor:[UIColor blackColor]];
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview:titleLabel];
        [self setTitleLabel:titleLabel];
        
        NSMutableArray *labels = [[NSMutableArray alloc] initWithCapacity:3];
        NSInteger index = 0;
        UILabel *label;
        for (NSString *buttonName in buttonNames) {
            label = [[UILabel alloc] initWithFrame:CGRectMake(labelXOrigin + (buttonWidth * index), labelYOrigin, buttonWidth, buttonHeight)];
            [label setText:buttonName];
            [label setFont:[UIFont systemFontOfSize:fontSize]];
            [label setTextColor:[UIColor blackColor]];
            [label setBackgroundColor:[UIColor clearColor]];
            [label setTextAlignment:UITextAlignmentCenter];
            [self addSubview:label];
            [labels addObject:label];
            [label release];
            index += 1;
        }
        
        [self setLabels:[labels copy]];
        [labels release];
        
        [self addTarget:self action:@selector(chooseLabel:forEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self setBackgroundColor:[UIColor clearColor]];
        
        CALayer *layer = [self layer];
        [layer setBackgroundColor:[[UIColor colorWithWhite:layerWhite alpha:layerAlpha] CGColor]];
        [layer setBorderWidth:borderWidth];
        [layer setBorderColor:[[UIColor colorWithWhite:borderWhite alpha:borderAlpha] CGColor]];
        [layer setCornerRadius:15.f];
        
        [self setExpanded:YES];
        
        [self setSelectedItem:selectedItem];
    }
    return self;    
}

- (id)initWithPoint:(CGPoint)point title:(NSString *)title buttonNames:(NSArray *)buttonNames selectedItem:(NSInteger)selectedItem
{
    [self initVariables];
    return [self initWithPoint:point title:title buttonNames:buttonNames selectedItem:selectedItem buttonWidth:defaultButtonWidth];    
}

- (id)initWithPoint:(CGPoint)point title:(NSString *)title buttonNames:(NSArray *)buttonNames
{
    return [self initWithPoint:point title:title buttonNames:buttonNames selectedItem:0 buttonWidth:defaultButtonWidth];
}

- (id)initWithPoint:(CGPoint)point title:(NSString *)title buttonNames:(NSArray *)buttonNames selectedItem:(NSInteger)selectedItem buttonImage:(NSString *)buttonImage {
    
    [self initVariables];
    
    CGFloat buttonWidth = 45;
    
    CGRect frameShrunk = CGRectMake(point.x, point.y, width + buttonWidth - 20, frameHeight);
    CGRect frameExpanded = CGRectMake(point.x, point.y, width + buttonWidth * [buttonNames count], frameHeight);
    if ((self = [super initWithFrame:frameShrunk])) {
        [self setFrameShrunk:frameShrunk];
        [self setFrameExpanded:frameExpanded];
        [self setButtonWidth:buttonWidth];
        
        UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:buttonImage]];
        iconView.frame = CGRectMake(10, 6, 20, 20);
        iconView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:iconView];
        
        labelXOrigin = 26.f;
        
        NSMutableArray *labels = [[NSMutableArray alloc] initWithCapacity:3];
        NSInteger index = 0;
        UILabel *label;
        for (NSString *buttonName in buttonNames) {
            label = [[UILabel alloc] initWithFrame:CGRectMake(labelXOrigin + (buttonWidth * index), labelYOrigin, buttonWidth, buttonHeight)];
            [label setText:buttonName];
            [label setFont:[UIFont systemFontOfSize:fontSize]];
            [label setTextColor:[UIColor blackColor]];
            [label setBackgroundColor:[UIColor clearColor]];
            [label setTextAlignment:UITextAlignmentCenter];
            [self addSubview:label];
            [labels addObject:label];
            [label release];
            index += 1;
        }
        
        [self setLabels:[labels copy]];
        [labels release];
        
        [self addTarget:self action:@selector(chooseLabel:forEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self setBackgroundColor:[UIColor clearColor]];
        
        CALayer *layer = [self layer];
        [layer setBackgroundColor:[[UIColor colorWithWhite:layerWhite alpha:layerAlpha] CGColor]];
        [layer setBorderWidth:borderWidth];
        [layer setBorderColor:[[UIColor colorWithWhite:borderWhite alpha:borderAlpha] CGColor]];
        [layer setCornerRadius:15.f];
        
        [self setExpanded:YES];
        
        [self setSelectedItem:selectedItem];
    }
    return self; 
}

- (id)initWithPoint:(CGPoint)point buttonImage:(NSString *)buttonImage buttonWidth:(CGFloat)buttonWidth {
    [self initVariables];
    
    CGRect frameShrunk = CGRectMake(point.x, point.y, buttonWidth, frameHeight);
    CGRect frameExpanded = CGRectMake(point.x, point.y, width, frameHeight);
    if ((self = [super initWithFrame:frameShrunk])) {
        [self setFrameShrunk:frameShrunk];
        [self setFrameExpanded:frameExpanded];
        [self setButtonWidth:buttonWidth];
        
        UIImage *icon = [UIImage imageNamed:buttonImage];
        
        UIImageView *iconView = [[UIImageView alloc] initWithImage:icon];
        iconView.frame = CGRectMake(11, 5, icon.size.width, icon.size.height);
        [self addSubview:iconView];
        
        
        [self addTarget:self action:@selector(chooseImage:forEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self setBackgroundColor:[UIColor clearColor]];
        
        CALayer *layer = [self layer];
        [layer setBackgroundColor:[[UIColor colorWithWhite:layerWhite alpha:layerAlpha] CGColor]];
        [layer setBorderWidth:borderWidth];
        [layer setBorderColor:[[UIColor colorWithWhite:borderWhite alpha:borderAlpha] CGColor]];
        [layer setCornerRadius:15.f];
        
        //[self setExpanded:YES];
        
    }
    return self; 
    
}

- (void)chooseImage:(id)sender forEvent:(UIEvent *)event {
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)chooseLabel:(id)sender forEvent:(UIEvent *)event {
    [UIView beginAnimations:nil context:NULL];
    if ([self expanded] == NO) {
        [self setExpanded:YES];
        
        NSInteger index = 0;
        for (UILabel *label in [self labels]) {
            if (index == [self selectedItem]) {
                [label setFont:[UIFont boldSystemFontOfSize:fontSize]];
            } else {
                [label setTextColor:[UIColor colorWithWhite:0.f alpha:.8f]];
            }
            [label setFrame:CGRectMake(labelXOrigin + ([self buttonWidth] * index), labelYOrigin, [self buttonWidth], labelHeight)];
            index += 1;
        }
        
        [[self layer] setFrame:CGRectMake([self frame].origin.x, [self frame].origin.y, [self frameExpanded].size.width, [self frameExpanded].size.height)];
    } else {
        BOOL inside = NO;
        
        NSInteger index = 0;
        for (UILabel *label in [self labels]) {
            if ([label pointInside:[[[event allTouches] anyObject] locationInView:label] withEvent:event]) {
                [label setFrame:CGRectMake(labelXOrigin, labelYOrigin, [self buttonWidth], labelHeight)];
                inside = YES;
                break;
            }
            index += 1;
        }
        
        if (inside) {
            [self setSelectedItem:index];
        }
    }
    [UIView commitAnimations];
}

- (NSInteger)selectedItem
{
    return _selectedItem;
}

- (void)setSelectedItem:(NSInteger)selectedItem
{
    if (selectedItem < [[self labels] count]) {
        CGRect leftShrink = CGRectMake(labelXOrigin, labelYOrigin, 0.f, labelHeight);
        CGRect rightShrink = CGRectMake(labelXOrigin + [self buttonWidth], labelYOrigin, 0.f, labelHeight);
        CGRect middleExpanded = CGRectMake(labelXOrigin, labelYOrigin, [self buttonWidth], labelHeight);
        NSInteger count = 0;    
        BOOL expanded = [self expanded];
        
        if (expanded) {
            [UIView beginAnimations:nil context:NULL];
        }
        
        for (UILabel *label in [self labels]) {
            if (count < selectedItem) {
                [label setFrame:leftShrink];
                [label setFont:[UIFont systemFontOfSize:fontSize]];
            } else if (count > selectedItem) {
                [label setFrame:rightShrink];
                [label setFont:[UIFont systemFontOfSize:fontSize]];
            } else if (count == selectedItem) {
                [label setFrame:middleExpanded];
                [label setFont:[UIFont systemFontOfSize:fontSize]];
                [label setTextColor:[UIColor blackColor]];
            }
            count += 1;
        }
        
        if (expanded) {
            [[self layer] setFrame:CGRectMake([self frame].origin.x, [self frame].origin.y, [self frameShrunk].size.width, [self frameShrunk].size.height)];
            [UIView commitAnimations];
            [self setExpanded:NO];
        }
        
        if (_selectedItem != selectedItem) {
            _selectedItem = selectedItem;
            [self sendActionsForControlEvents:UIControlEventValueChanged];
        }        
    }
}

- (void)dealloc {
    [self setTitleLabel:nil];
    [self setLabels:nil];
    [super dealloc];
}


@end
