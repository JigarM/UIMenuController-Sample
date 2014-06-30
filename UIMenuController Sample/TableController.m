//
//  TableController.m
//  UIMenuController Sample
//
//  Created by Jigar M on 30/06/14.
//  Copyright (c) 2014 Jigar. All rights reserved.
//

#import "TableController.h"

@interface TableController ()

@end

@implementation TableController{
    NSArray *data;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    data = [NSArray arrayWithObjects:@"A - Apple", @"B - Ball", @"C - Cat",@"D - Dog", @"E - Elephant", @"F - Fox",@"G - Goat", @"H - Hen", @"I - Iron",@"J - Jug", @"K - Kite", @"L - Lock",@"M - Monkey", @"N - Nail", @"O - Owl",@"P - Parrot", @"Q - Queen", @"R - Rat",@"S - Ship", @"T - Toy", @"U - Umbrella",@"V - Van", @"W - Watermelon", @"X - Xylophone",@"Y - Yak", @"Z - Zebra", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [data count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [data objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor colorWithRed:(121/255.0) green:(130/255.0) blue:(210/255.0) alpha:1.0];
    UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [cell addGestureRecognizer:recognizer];
    
    return cell;
}

#pragma mark - Menu controller

- (void)longPress:(UILongPressGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        UITableViewCell *cell = (UITableViewCell *)recognizer.view;
        
        UIMenuItem *Select = [[UIMenuItem alloc] initWithTitle:@"Select" action:@selector(Select:)];
        UIMenuItem *Selectall = [[UIMenuItem alloc] initWithTitle:@"Select all" action:@selector(Selectall:)];
        UIMenuItem *Copy = [[UIMenuItem alloc] initWithTitle:@"Copy" action:@selector(Copy:)];
        UIMenuItem *Delete = [[UIMenuItem alloc] initWithTitle:@"Delete" action:@selector(Delete:)];
        UIMenuItem *Forward = [[UIMenuItem alloc] initWithTitle:@"Forward" action:@selector(Forward:)];
        
        UIMenuController *menu = [UIMenuController sharedMenuController];
        [menu setMenuItems:[NSArray arrayWithObjects:Select, Selectall, Copy,Delete, Forward, nil]];
        [menu setTargetRect:cell.frame inView:cell.superview];
        [menu setMenuVisible:YES animated:YES];
    }
}

- (void)Select:(id)sender {
    NSLog(@"Cell was Selected..");
}

- (void)Selectall:(id)sender {
    NSLog(@"Cell was Selected");
}

- (void)Copy:(id)sender {
    NSLog(@"Cell was Copied");
}

- (void)Delete:(id)sender {
    NSLog(@"Cell was Deleted");
}

- (void)Forward:(id)sender {
    NSLog(@"Cell was Forwarded");
}

@end
