//
//  ViewController.m
//  ImageMagick_iphone
//
//  Created by liulian on 2017/12/12.
//  Copyright © 2017年 liulian. All rights reserved.
//

#import "ViewController.h"
#import "MagickWand.h"
#include "utility.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ImageConvert];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)ImageConvert{
    
    NSLog(@"***********ImageConvert**********");
    //        //pcx
//        const char* test_base64 = "CgUBCAAAAAAiACIAkACQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEIwABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADL/8HsuIliQSoeKkFiibjB7Mv/y//B6rF9Ui4VBxUuUn2xwerL/8v/wf7B/MH7wfnB+MP3wfjB+cH7wfzB/sv/4//J/8HRikfLHUeKwdHJ/8n/wcx+NMsGNH7BzMn/yf/B/cH7wfjL98H4wfvB/cn/4//H/8HkjjvPHTuOweTH/8f/weKDJ88GJ4PB4sf/x//B/sH7wfjP98H4wfvB/sf/4//G/8HAX9MdX8HAxv/G/7pP0wZPusb/xv/B/cH50/fB+cH9xv/j/8X/rkPVHUOuxf/F/6Yw1QYwpsX/xf/B/MH41ffB+MH8xf/j/8T/rjrXHTquxP/E/6Ym1wYmpsT/xP/B/MH41/fB+MH8xP/j/8P/wcBD2R1DwcDD/8P/ujDZBjC6w//D/8H9wfjZ98H4wf3D/+P/wv/B5F/bHV/B5ML/wv/B4k/bBk/B4sL/wv/B/sH52/fB+cH+wv/j/8L/jt0djsL/wv+D3QaDwv/C/8H73ffB+8L/4//B/8HRO90dO8HRwf/B/8HMJ90GJ8HMwf/B/8H9wfjd98H4wf3B/+P/wf+K3x2Kwf/B/37fBn7B/8H/wfvf98H7wf/j/8HsR98dR8Hsweo03wY0werB/sH43/fB+MH+4/+44R24seEGscH84ffB/OP/ieEdiX3hBn3B++H3wfvj/2LhHWJS4QZSwfnh98H54/9B4R1BLuEGLsH44ffB+OP/KuEdKhXhBhXj9+P/HuEdHgfhBgfj9+P/KuEdKhXhBhXj9+P/QeEdQS7hBi7B+OH3wfjj/2LhHWJS4QZSwfnh98H54/+J4R2JfeEGfcH74ffB++P/uOEduLHhBrHB/OH3wfzj/8HsR98dR8Hsweo03wY0werB/sH43/fB+MH+4//B/4rfHYrB/8H/ft8GfsH/wf/B+9/3wfvB/+P/wf/B0TvdHTvB0cH/wf/BzCfdBifBzMH/wf/B/cH43ffB+MH9wf/j/8L/jt0djsL/wv+D3QaDwv/C/8H73ffB+8L/4//C/8HkX9sdX8Hkwv/C/8HiT9sGT8Hiwv/C/8H+wfnb98H5wf7C/+P/w//BwEPZHUPBwMP/w/+6MNkGMLrD/8P/wf3B+Nn3wfjB/cP/4//E/6461x06rsT/xP+mJtcGJqbE/8T/wfzB+Nf3wfjB/MT/4//F/65D1R1DrsX/xf+mMNUGMKbF/8X/wfzB+NX3wfjB/MX/4//G/8HAX9MdX8HAxv/G/7pP0wZPusb/xv/B/cH50/fB+cH9xv/j/8f/weSOO88dO47B5Mf/x//B4oMnzwYng8Hix//H/8H+wfvB+M/3wfjB+8H+x//j/8n/wdGKR8sdR4rB0cn/yf/BzH40ywY0fsHMyf/J/8H9wfvB+Mv3wfjB+8H9yf/j/8v/wey4iWJBKh4qQWKJuMHsy//L/8HqsX1SLhUHFS5SfbHB6sv/y//B/sH8wfvB+cH4w/fB+MH5wfvB/MH+y//j/w==";
    //svg
   const char* test_base64 = "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4KPCFET0NUWVBFIHN2ZyBQVUJMSUMgIi0vL1czQy8vRFREIFNWRyAxLjEvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkIj4KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSLlm77lsYJfMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeD0iMHB4IiB5PSIwcHgiIHdpZHRoPSI1OTUuMjhweCIgaGVpZ2h0PSI4NDEuODlweCIgdmlld0JveD0iMCAwIDU5NS4yOCA4NDEuODkiIGVuYWJsZS1iYWNrZ3JvdW5kPSJuZXcgMCAwIDU5NS4yOCA4NDEuODkiIHhtbDpzcGFjZT0icHJlc2VydmUiPgogICAgPGxpbmUgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMjMxODE1IiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIHgxPSIxNDgiIHkxPSIxMTgiIHgyPSIzODQiIHkyPSI2MTYiLz4KICAgIDxsaW5lIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzIzMTgxNSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiB4MT0iOTEiIHkxPSI1MDUiIHgyPSI0NTQiIHkyPSIxNTciLz4KICAgIDxsaW5lIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzIzMTgxNSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiB4MT0iNDEiIHkxPSIxOTkiIHgyPSIzOTEiIHkyPSI0MzYiLz4KICAgIDxsaW5lIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzIzMTgxNSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiB4MT0iMzM5IiB5MT0iMTQ4IiB4Mj0iMTY0IiB5Mj0iNTYyIi8+Cjwvc3ZnPgo=";
    int len_test = 0;
    unsigned char* byte_test;
    size_t len1 = 0;
    byte_test = Base64Decode(test_base64, &len1);
    for (int i=0; i<len1; i++) {
        
        printf("%.2x",byte_test[i]);
    }
    MagickWand *w_wand = NULL;
    MagickWandGenesis();
    w_wand = NewMagickWand();
    MagickBooleanType status;
    status = MagickSetResolution(w_wand,50 ,50 );
    if (status == MagickTrue) {
        
        printf("\nMagickSetResolution success");
    }else{
        
        printf("\nMagickSetResolution success");
    }
    
    status = MagickReadImageBlob(w_wand,byte_test,len1);
    if (status == MagickTrue) {
        
        printf("\nread ok");
        char* format = MagickGetImageFormat(w_wand);
        printf("format:%s",format);
        MagickSetImageFormat(w_wand, "jpg");
        //        std::string path = FileUtils::getInstance()->getWritablePath()+"test_emf.jpg";
        //        //printf("ImageMagick::path:%s",path.c_str());
        //        status = MagickWriteImage(w_wand, path.c_str());
        
        if (status == MagickTrue) {
            
            printf("\nread ok 转换格式成功");
            char* format = MagickGetImageFormat(w_wand);
            printf("format:%s\n",format);
            size_t len;
            unsigned char* byte = MagickGetImageBlob(w_wand, &len);
            
            //                char pngStr[len+1];
            //                memset(pngStr,0,len+1);
            //                printf("byte:");
            //                for (int i=0; i<len; i++) {
            //
            //                        //printf("%.2x",byte[i]);
            //                    pngStr[i]=byte[i];
            //                    printf("%.2x",pngStr[i]);
            //
            //                }
            //                printf("\npngStr:%s",pngStr);
            
            //            int len1 = 0;
            //            char *encodedData = 0;
            //            len1 = Base64Encode(byte, len, &encodedData);
            //            std::string message = encodedData;
            //            printf("  %s\n",message.c_str());
            //
            //            // std::string pngJson = makePngjson(pngStr, len);
            //            std::string methodName = "ImageConvert";
            //            const char* postData = KM::Tools::createSynResult(methodName.c_str(), "0000", message.c_str());
            //            notifySMHelper(postData);
            
            
        }else{
            
            
            printf("\nread false");
            
        }
        
        
    }else{
        
        printf("\nread false\n");
    }


    
}


@end
