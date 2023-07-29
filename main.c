#include <stdio.h>
#include <stdint.h>

#define DEBUG 1

#define OUTPUT_FILE "./prim_ycc_2.bmp"
#define INPUT_FILE "./primaries.bmp"

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

typedef struct Image {
	int width;
	int height;
	int first_pixel;
    } image_t;

image_t imagePreprocessing(FILE* file, image_t input_image){
    int image_data_address = 0;
    int width = 0;
    int height = 0;
    int bit_depth = 0;
    
    #if DEBUG == 1
    printf("Image Preprocessing:\n");
    printf("Image type: %c%c\n", fgetc(file), fgetc(file));
    #endif
    
    fseek(file, 10, SEEK_SET);
    fread(&image_data_address, 4, 1, file); //Location of pixel array
    
    #if DEBUG == 1
    printf("Image Data Address: %d\n", image_data_address);
    #endif

    fseek(file, 4, SEEK_CUR);
    fread(&width, 4, 1, file);
    fread(&height, 4, 1, file);
    fseek(file, 2, SEEK_CUR);
    fread(&bit_depth, 2, 1, file); //# of bits per pixel
    fseek(file, image_data_address, SEEK_SET);
    input_image.first_pixel = image_data_address;
    input_image.height = height;
    input_image.width = width;

    #if DEBUG == 1
    printf("Image fields filled\n");
    #endif

    return input_image;
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
    FILE *f_output_YCC = fopen(OUTPUT_FILE, "wb");
    FILE *f_input_RGB = fopen(INPUT_FILE, "rb");
    if(f_input_RGB == NULL) {
        printf("Cannot open file.\n");
        return(-1);
    }

    image_t input_image = imagePreprocessing(f_input_RGB, input_image);

    #if DEBUG == 1
    printf("Input Image: h-%d, w-%d, px-%d\n", input_image.height, input_image.width, input_image.first_pixel);
    #endif
    
    // Copy header into YCC file
    fseek(f_input_RGB, 0, SEEK_SET);
    u_int8_t tmp[56];
    register int i = 0;
    
    #if DEBUG == 1
    printf("Begin copying header\n");
    #endif

    for(i = 0; i < input_image.first_pixel; i++){

        #if DEBUG == 1
        printf("%d ", i);
        #endif

        fread(tmp, 1, 1, f_input_RGB);
        fprintf(f_output_YCC, "%c", *tmp);
    }

    #if DEBUG == 1
    printf("\nFinished copying header\n");
    printf("Starting conversion\n");
    #endif

    // Seek to start of pixels
    //fseek(f_input_RGB, input_image.first_pixel, SEEK_SET);

    //uint8_t YCC_pixel_array[input_image.height][input_image.width * 3];
    rgbdata pixel;
    yccdata converted_pixel;
    //int i = 0;
    int j = 0;
    for(i = 0; i < input_image.height; i++){
        for(j = 0; j < input_image.width; j++){
            fread(&pixel.B, 1, 1, f_input_RGB); //
            fread(&pixel.G, 1, 1, f_input_RGB); //Replacing obtainPixelValue
            fread(&pixel.R, 1, 1, f_input_RGB); //
            converted_pixel = convertRGBtoYCC(pixel);
    /*	    printf("Converted Pixel Value: Y:%d Cb:%d, Cr:%d\n", converted_pixel.Y, converted_pixel.Cb, converted_pixel.Cr);	    
            YCC_pixel_array[i][j * 3] = converted_pixel.Y;
            YCC_pixel_array[i][j * 3 + 1] = converted_pixel.Cb;
            YCC_pixel_array[i][j * 3 + 2] = converted_pixel.Cr;
    */
            fprintf(f_output_YCC, "%c%c%c", converted_pixel.Cr, converted_pixel.Cb, converted_pixel.Y); //Replacing postConversionProcessing
            
        }
	//fprintf(f_output_YCC, "\n"); //Uncomment for YCC values
    }

    #if DEBUG == 1
    printf("Finished conversion\n");
    #endif

    fclose(f_input_RGB);
    fclose(f_output_YCC);

/* 
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

    printf("Converted RGB value (%d, %d, %d) to YCC value (%d, %d, %d)\n",RGB.R, RGB.G, RGB.B, YCC.Y, YCC.Cb, YCC.Cr);
*/

}


