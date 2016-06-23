//
//  FirstViewController.m
//  GroceryChecker
//
//  Created by Andy Lin on 2016-06-22.
//  Copyright © 2016 Andy Lin. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (nonatomic,weak) IBOutlet UITextField *inputField;
@property (nonatomic,weak) IBOutlet UILabel *message;
@property IBOutlet UITableView *itemList;

@end

@implementation FirstViewController
{
    NSMutableArray *tableData;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    tableData = [NSMutableArray arrayWithObjects:@"Apples",@"Bananas",@"Carrots", nil];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)Enter {
    NSString *input = self.inputField.text;
    if ([input length] == 0){
        input = @"NULL";
    }
    [tableData addObject:input];
    [self.itemList reloadData];
    self.message.text = [NSString stringWithFormat:@"%@ was added to the list",input];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tableData count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc ] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
