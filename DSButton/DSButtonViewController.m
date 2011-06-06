//
//  DSButtonViewController.m
//  DSButton
//
//  Created by David Slone on 6/3/11.
//  Copyright 2011 pxlsinmotion LLC. All rights reserved.
//

#import "DSButtonViewController.h"
#import "DSButton.h"

@implementation DSButtonViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    DSButton *withOptions = [[DSButton alloc] initWithPoint:CGPointMake(10, 10) title:@"Torch" buttonNames:[NSArray arrayWithObjects:@"On",@"Off", nil] selectedItem:1];
    [withOptions addTarget:self action:@selector(optionChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:withOptions];
    [withOptions release];
    
    DSButton *imageWithOptions = [[DSButton alloc] initWithPoint:CGPointMake(10, 50) title:@"" buttonNames:[NSArray arrayWithObjects:@"On", @"Off", nil] selectedItem:0 buttonImage:@"61-brightness.png"];
    [imageWithOptions addTarget:self action:@selector(optionChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:imageWithOptions];
    [imageWithOptions release];
    
    DSButton *imageOnly = [[DSButton alloc] initWithPoint:CGPointMake(10,90) buttonImage:@"61-brightness.png" buttonWidth:45.f];
    [imageOnly addTarget:self action:@selector(optionChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:imageOnly];
    [imageOnly release];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -

- (void)optionChange:(id)sender 
{
    int selectedItem = [(DSButton *)sender selectedItem];
    NSLog(@"selected: %i", selectedItem);

}
@end
