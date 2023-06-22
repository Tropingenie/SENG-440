#include <stdio.h>
#include <stdint.h>

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

inline yccdata convert(rgbdata RGB){
    yccdata YCC;
    register uint8_t Y, Cb, Cr;

    Y  = (uint8_t)(16  + (uint16_t)(( 65.738 * RGB.R) + (129.057 * RGB.G) + ( 25.064 * RGB.B)) >> 8);
    Cb = (uint8_t)(128 - (uint16_t)(( 37.945 * RGB.R) - ( 74.494 * RGB.G) + (112.439 * RGB.B)) >> 8);
    Cr = (uint8_t)(128 + (uint16_t)((112.439 * RGB.R) + ( 94.154 * RGB.G) + ( 18.285 * RGB.B)) >> 8);

    return YCC = (yccdata){.Y=Y, .Cr=Cr, .Cb=Cb};
}

int main(void){

    rgbdata RGB = (rgbdata){.R=0, .G=255, .B=0};

    yccdata YCC = convert(RGB);

    printf("Converted RGB value (%d, %d, %d) to YCC value (%d, %d, %d)\n",
          RGB.R, RGB.G, RGB.B, YCC.Y, YCC.Cb, YCC.Cr);

}