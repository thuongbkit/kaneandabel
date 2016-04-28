//
//  StoryListController.m
//  KeanAndAbel
//
//  Created by KeizuDevMacMini on 4/27/16.
//  Copyright (c) 2016 Thuong Nguyen Quoc. All rights reserved.
//

#import "StoryListController.h"
#import "Story.h"
#import "StoryDetailViewController.h"

@interface StoryListController ()

@property (nonatomic, copy) NSArray *stories;

@end

@implementation StoryListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.stories = @[];
    
    [Story loadStories:^(NSArray *stories, NSError *error) {
        if (stories && stories.count > 0) {
            self.stories = stories;
            NSMutableArray *indexPaths = [NSMutableArray array];
            for (NSUInteger row = 0; row < stories.count; row++) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
                [indexPaths addObject:indexPath];
            }
            [self.tableView beginUpdates];
            [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
            [self.tableView endUpdates];
        }
    }];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.stories count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StoryCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"StoryCell"];
    }
    cell.textLabel.font = [UIFont fontWithName:@"Times New Roman" size:20];
    cell.textLabel.text = [self.stories[indexPath.row] title];
    return cell;
}




#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showStoryDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        StoryDetailViewController *destVC = segue.destinationViewController;
        destVC.stories = [self.stories objectAtIndex:indexPath.row];
    }
    }


@end
