//
//  ViewController.m
//  iResume
//
//  Created by Valentine on 30.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "ViewController.h"
#import "TitleViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize scrollView, pageControl;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//	NSArray *colors = [NSArray arrayWithObjects:[[UIColor redColor] colorWithAlphaComponent:0.5f], [[UIColor greenColor] colorWithAlphaComponent:0.5f], [[UIColor blueColor] colorWithAlphaComponent:0.5f], nil];
//    for (int i = 0; i < colors.count; i++)
//	{
//        CGRect frame;
//        frame.origin.x = self.scrollView.frame.size.width * i;
//        frame.origin.y = 0;
//        frame.size = self.scrollView.frame.size;
//		
//        UIView *subview = [[UIView alloc] initWithFrame:frame];
//        subview.backgroundColor = [colors objectAtIndex:i];
////		subview.alpha = 0.5f;
//        [self.scrollView addSubview:subview];
//    }
//	NSArray *colors = [NSArray arrayWithObjects:[[UIColor redColor] colorWithAlphaComponent:0.5f], [[UIColor greenColor] colorWithAlphaComponent:0.5f], [[UIColor blueColor] colorWithAlphaComponent:0.5f], nil];
    for (int i = 0; i < 3; i++)
	{
        CGRect frame;
        frame.origin.x = self.scrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.scrollView.frame.size;
		
//        UIView *subview = [[UIView alloc] initWithFrame:frame];
//        subview.backgroundColor = [colors objectAtIndex:i];
		//		subview.alpha = 0.5f;
		TitleViewController *tvc = [[TitleViewController alloc] initWithNibName:@"TitleViewController" bundle:[NSBundle mainBundle]];
		UIView *subview = tvc.view;
		subview.frame = CGRectMake(self.scrollView.frame.size.width * i, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        [self.scrollView addSubview:subview];
    }

	self.scrollView.layer.contents = (id)[UIImage imageNamed:@"Default"].CGImage;
	self.scrollView.delegate = self;
	self.scrollView.decelerationRate = UIScrollViewDecelerationRateFast;
	self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * 3, self.scrollView.frame.size.height);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
	self.scrollView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark -
#pragma mark UIScrollViewDeleagte

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}

#pragma mark -
#pragma mark UIPageControl

- (IBAction)changePage
{
	CGRect frame;
    frame.origin.x = self.scrollView.frame.size.width * self.pageControl.currentPage;
    frame.origin.y = 0;
    frame.size = self.scrollView.frame.size;
    [self.scrollView scrollRectToVisible:frame animated:YES];
}

@end
