//
//  ViewController.m
//  LeanChatExample
//
//  Created by lzw on 15/4/3.
//  Copyright (c) 2015年 avoscloud. All rights reserved.
//

#import "LoginViewController.h"
#import "LCECommon.h"
#import "CDUserFactory.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *selfIdTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)login:(id)sender {
    NSString* selfId=self.selfIdTextField.text;
    if(selfId.length>0){
        CDIM* im=[CDIM sharedInstance];
        im.userDelegate=[[CDUserFactory alloc] init];
        [im openWithClientId:selfId callback:^(BOOL succeeded, NSError *error) {
            if(error){
                DLog(@"%@",error);
            }else{
                [self performSegueWithIdentifier:@"goMain" sender:sender];
            }
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
}

@end
