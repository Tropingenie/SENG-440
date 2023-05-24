#include <stdio.h>

typedef struct RGBData {
        short R;
        short G;
        short B;
    } rgbdata;

typedef struct YCCData {
        float Y;
        float Cb;
        float Cr;
    } yccdata;

yccdata convert(rgbdata RGB){
    yccdata YCC;

    YCC.Y  = 16  + ( 65.738 * RGB.R / 256.0) + (129.057 * RGB.G / 256.0) + ( 25.064 * RGB.B / 256.0);
    YCC.Cb = 128 - ( 37.945 * RGB.R / 256.0) - ( 74.494 * RGB.G / 256.0) + (112.439 * RGB.B / 256.0);
    YCC.Cr = 128 + (112.439 * RGB.R / 256.0) + ( 94.154 * RGB.G / 256.0) + ( 18.285 * RGB.B / 256.0);

    return YCC;
}

int main(void){

    rgbdata RGB = (rgbdata){.R=0, .G=255, .B=0};

    yccdata YCC = convert(RGB);

    printf("Converted RGB value (%d, %d, %d) to YCC value (%.2f, %.2f, %.2f)",
          RGB.R, RGB.G, RGB.B, YCC.Y, YCC.Cb, YCC.Cr);

}