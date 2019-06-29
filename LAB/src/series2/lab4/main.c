#include <stdio.h>
#include "../common/common.h"

void draw_plate (int x0,int y0,int r,int color){

    if (r <= 0) return ;
    if (x0 + r < 0 || x0 - r > SCREEN_WIDTH) return ;
    if (y0 + r < 0 || y0 - r > SCREEN_HEIGHT) return ;
    
    int x,y;

    for (x = x0 -r ; x <= x0 + r ;x ++  ){
        for ( y = y0 -r;y <= y0 + r; y++) {
            if ( (x - x0)* (x - x0) + (y - y0) * (y - y0) <= r * r) {
                fb_draw_pixel(x,y,color);
            }
        }
    }
}



int main(int argc, char *argv[])
{
	fb_init("/dev/graphics/fb0");
	// fb_draw_rect(0,0,SCREEN_WIDTH,SCREEN_HEIGHT,FB_COLOR(255,255,255));
	fb_image *bg;
    bg = fb_read_png_image("/data/local/backGround.png");
    fb_draw_image(0,0,bg,0);
    fb_update();

    int r = 40; // Radius of plate.
    int finger_color[5] = {  // Prepared ForeGroundColor.
        FB_COLOR(65,105,225),  //Blue
        FB_COLOR(0,255,127),   //Spring Green
        FB_COLOR(255,215,0),   //Gold 
        FB_COLOR(255,140,0),   //Dark Orange
        FB_COLOR(255,69,0)     //Orange Red
    };

    int last_x [5];
    int last_y [5];

    int k;
    for (k = 0;k<5;k++){
        last_x[k] = last_y[k] = -1;
    }

	touch_init("/dev/input/event3");
	int type,x,y,finger,i;
	while(1){
		type = touch_read(&x,&y,&finger);
		switch(type){
			case TOUCH_PRESS:
				printf("TOUCH_PRESS：x=%d,y=%d,finger=%d\n",type,x,y,finger);
                draw_plate(x,y,r,finger_color[finger]);
                last_x[finger] = x;
                last_y[finger] = y;
                fb_update();
				break;
			case TOUCH_MOVE:
				printf("TOUCH_MOVE：x=%d,y=%d,finger=%d\n",type,x,y,finger);
                if (last_x[finger] == -1) last_x[finger] = x;
                if (last_y[finger] == -1) last_y[finger] = y;
                // draw_plate(last_x[finger],last_y[finger],r,FB_COLOR(255,255,255));
                fb_draw_image(0,0,bg,0);
                last_x[finger] = x;
                last_y[finger] = y;
                for (i = 0;i<5;i++){
                    if (last_x[i] != -1 && last_y[i] != -1){
                        draw_plate(last_x[i],last_y[i],r,finger_color[i]);
                    }
                }
                fb_update();
				break;
			case TOUCH_RELEASE:
				printf("TOUCH_RELEASE：x=%d,y=%d,finger=%d\n",type,x,y,finger);
                
                // draw_plate(x,y,r,FB_COLOR(255,255,255));
                fb_draw_image(0,0,bg,0);
                last_x[finger] = -1;
                last_y[finger] = -1;
                for (i=0;i<5;i++){
                    if (last_x[i] != -1 && last_y[i] != -1) {
                        draw_plate(last_x[i],last_y[i],r,finger_color[i]);
                    }
                }
                fb_update();
				break;
			default:
				break;
		}
	}
    fb_free_image(bg);
	return 0;
	
}
