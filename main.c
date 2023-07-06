#include <stdio.h>
#include <stdint.h>

#define DEBUG 1

#if DEBUG == 1
#include <stdlib.h>
#include <time.h>
#endif

typedef struct RGBData {
        uint8_t R;
        uint8_t G;
        uint8_t B;
    } rgbdata;

typedef struct YCCData {
        uint8_t Y;
        uint8_t Cb;
        uint8_t Cr;
    } yccdata;

extern inline void imagePreprocessing( void ){
    return;
}

extern inline void postConversionProcessing( void ){
    return;
}

extern inline yccdata convertRGBtoYCC(rgbdata RGB){
    yccdata YCC;
    register uint8_t Y, Cb, Cr, R, G, B;

    R = RGB.R;
    G = RGB.G;
    B = RGB.B;

    Y  = (uint8_t)(16  + (((R << 6) + (R << 1) + (G << 7) + G + (B << 4) + (B << 3) + B) >> 8));
    Cb = (uint8_t)(128 + (( -((R << 5) + (R << 2) + (R << 1)) - ((G << 6) + (G << 3) + (G << 1)) + (B << 7) - (B << 4)) >> 8));
    Cr = (uint8_t)(128 + (((R << 7) - (R << 4) - ((G << 6) + (G << 5) - (G << 1)) - ((B << 4) + (B << 1))) >> 8));

    return YCC = (yccdata){.Y=Y, .Cb=Cb, .Cr=Cr};
}

extern inline rgbdata obtainPixelValue( void ){
    rgbdata RGB;
    return RGB = (rgbdata){.R=0, .G=255, .B=0}; // Placeholder
}

int main(void){
    rgbdata RGB;
    #if DEBUG == 1
    srand(time(NULL));
    RGB = (rgbdata){
        .R = rand()%256,
        .G = rand()%256,
        .B = rand()%256
    };
    #else
    RGB = obtainPixelValue();
    #endif


    yccdata YCC = convertRGBtoYCC(RGB);

    printf("Converted RGB value (%d, %d, %d) to YCC value (%d, %d, %d)\n",
          RGB.R, RGB.G, RGB.B, YCC.Y, YCC.Cb, YCC.Cr);

}