//
//  ViewController.m
//  KeanAndAbel
//
//  Created by KeizuDevMacMini on 4/27/16.
//  Copyright (c) 2016 Thuong Nguyen Quoc. All rights reserved.
//

#import "ViewController.h"
#import "Story.h"

@interface ViewController ()
@property (nonatomic, copy) NSArray *stories;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.stories = @[];
    
    [Story loadStories:^(NSArray *stories, NSError *error) {
        if (stories && stories.count > 0) {
            //self.stories = stories;
            NSLog(@"%@", [stories objectAtIndex:1] );
        }
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
