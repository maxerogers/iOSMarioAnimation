//
//  ViewController.m
//  MarioAnimation
//
//  Created by Max Rogers on 10/10/14.
//  Copyright (c) 2014 maxrogers. All rights reserved.
//

#import "ViewController.h"
#include <stdlib.h>


@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //This here is my animation timer
    [NSTimer scheduledTimerWithTimeInterval:0.5f
                                     target:self selector:@selector(mario_swim:) userInfo:nil repeats:YES];
    _mario_state = 2;
    _luigi_state = 2;
    _background_state = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) mario_swim:(NSTimer *)timer{
    if(_mario_state == 0){
        _mario_state = 1;
        [_mario setImage: [UIImage imageNamed:@"mario_swimming_1.png"]];
        [_luigi setImage: [UIImage imageNamed:@"luigi_swimming_1.png"]];
    }else if (_mario_state == 1){
        _mario_state = 2;
        [_mario setImage: [UIImage imageNamed:@"mario_swimming_2.png"]];
        [_luigi setImage: [UIImage imageNamed:@"luigi_swimming_2.png"]];
    }else{
        _mario_state = 0;
        [_mario setImage: [UIImage imageNamed:@"mario_swimming_0.png"]];
        [_luigi setImage: [UIImage imageNamed:@"luigi_swimming_0.png"]];
    }
    int r = rand() % 100;
    int x = 10;
    int y = 10;
    if(r > 75){
        x = 10;
        y = 10;
    }else if(r > 50){
        x = -10;
        y = 10;
    }else if(r > 25){
        x = 10;
        y = -10;
    }else{
        x = -10;
        y = -10;
    }
    NSLog(@"%d",r);
    [UIView animateWithDuration:0.5f animations:^{ _mario.frame=CGRectMake(_mario.frame.origin.x-x,_mario.frame.origin.y-y,160,160);
    }];
    //The last two arguments deteremine the size of the animated to frame
    [UIView animateWithDuration:0.5f animations:^{ _luigi.frame=CGRectMake(_luigi.frame.origin.x-x,_luigi.frame.origin.y-y,160,160);
    }];
    
    if(_background_state == 0){
        [_background setImage: [UIImage imageNamed:@"water_background_1.png"]];
        _background_state = 1;
    }else if(_background_state == 1){
        [_background setImage: [UIImage imageNamed:@"water_background_2.png"]];
        _background_state = 2;
    }else if(_background_state == 2){
        [_background setImage: [UIImage imageNamed:@"water_background_3.png"]];
        _background_state = 3;
    }else{
        [_background setImage: [UIImage imageNamed:@"water_background_4.png"]];
        _background_state = 0;
    }
    [_background setImage: [UIImage imageNamed:@"water_background_3.png"]];

}

@end
