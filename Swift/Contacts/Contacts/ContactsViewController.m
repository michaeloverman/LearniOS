//
//  ViewController.m
//  Contacts
//
//  Created by Michael Overman on 9/19/19.
//  Copyright © 2019 Michael Overman. All rights reserved.
//

#import "ContactsViewController.h"
#import "Contacts-Swift.h"

@interface ContactsViewController ()

@property (nonatomic, readonly, strong) NSMutableArray *contacts;

@end

@implementation ContactsViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
//        NSArray *contactArray = @[@"Johnny Appleseed",
//                                  @"Paul Bunyan",
//                                  @"Calamity Jane"];
        Contact *c1 = [[Contact alloc]initWithContactName:@"Johnny Appleseed"];
        Contact *c2 = [[Contact alloc]initWithContactName:@"Paul Bunyon"];
        Contact *c3 = [[Contact alloc]initWithContactName:@"Calamity Jane"];
        _contacts = [NSMutableArray arrayWithArray:@[c1,c2,c3]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"UITableViewCell"
                             forIndexPath:indexPath];
    Contact *contact = self.contacts[indexPath.row];
    cell.textLabel.text = contact.name;
    return cell;
}

@end
