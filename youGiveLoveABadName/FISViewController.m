//
//  FISViewController.m
//  youGiveLoveABadName
//
//  Created by Joe Burgess on 7/9/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *bonJovi;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bonJoviHeightConstraint;
@property (weak, nonatomic) IBOutlet UIButton *expandButton;
@property (nonatomic) BOOL isExpanded;

- (IBAction)expand:(id)sender;

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.expandButton.layer.cornerRadius = 17;
    [self.expandButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)expand:(id)sender
{
    if (!self.isExpanded) {
        [UIView animateKeyframesWithDuration:0.6
                                       delay:0
                                     options:UIViewKeyframeAnimationOptionCalculationModeCubic
                                  animations:^{
                                      [UIView addKeyframeWithRelativeStartTime:0
                                                              relativeDuration:0.25
                                                                    animations:^{
                                                                        self.bonJoviHeightConstraint.constant = -15;
                                                                        [self.view layoutIfNeeded];
                                                                    }];
                                      [UIView addKeyframeWithRelativeStartTime:0.25
                                                              relativeDuration:0.50
                                                                    animations:^{
                                                                        self.bonJoviHeightConstraint.constant = 400;
                                                                        [self.view layoutIfNeeded];
                                                                    }];
                                      [UIView addKeyframeWithRelativeStartTime:0.75
                                                              relativeDuration:0.25
                                                                    animations:^{
                                                                        self.bonJoviHeightConstraint.constant = 375;
                                                                        [self.view layoutIfNeeded];
                                                                    }];
                                  }
                                  completion:^(BOOL finished) {
                                      NSLog(@"Bon Jovi expanded.");
                                  }];
        [UIView animateWithDuration:0.4
                         animations:^{
                             self.expandButton.backgroundColor = [UIColor clearColor];
                             [self.expandButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                         }];
    } else {
        [UIView animateKeyframesWithDuration:0.6
                                       delay:0
                                     options:UIViewKeyframeAnimationOptionCalculationModeCubic
                                  animations:^{
                                      [UIView addKeyframeWithRelativeStartTime:0
                                                              relativeDuration:0.25
                                                                    animations:^{
                                                                        self.bonJoviHeightConstraint.constant = 425;
                                                                        [self.view layoutIfNeeded];
                                                                    }];
                                      [UIView addKeyframeWithRelativeStartTime:0.25
                                                              relativeDuration:0.50
                                                                    animations:^{
                                                                        self.bonJoviHeightConstraint.constant = -15;
                                                                        [self.view layoutIfNeeded];
                                                                    }];
                                      [UIView addKeyframeWithRelativeStartTime:0.75
                                                              relativeDuration:0.25
                                                                    animations:^{
                                                                        self.bonJoviHeightConstraint.constant = 0;
                                                                        [self.view layoutIfNeeded];
                                                                    }];
                                  }
                                  completion:^(BOOL finished) {
                                      NSLog(@"Bon Jovi shrunk.");
                                  }];

        [UIView animateWithDuration:0.4
                              delay:0.25
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.expandButton.backgroundColor = [UIColor colorWithRed:0xE7 / 255.0
                                                                                 green:0xE7 / 255.0
                                                                                  blue:0xE7 / 255.0
                                                                                 alpha:1.0];
                             
                             [self.expandButton setTitleColor:[UIColor grayColor]
                                                     forState:UIControlStateNormal];
                         }
                         completion:nil];
    }
    
    self.isExpanded = !self.isExpanded;
}
@end
