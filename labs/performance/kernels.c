/********************************************************
 * Kernels to be optimized for the CS:APP Performance Lab
 ********************************************************/

#include <stdio.h>
#include <stdlib.h>
#include "defs.h"

/* 
 * Please fill in the following team struct 
 */
team_t team = {
    "bohan's team",              /* Team name */

    "zbh",     /* First member full name */
    "bohan-zhang@foxmail.com",  /* First member email address */

    "",                   /* Second member full name (leave blank if none) */
    ""                    /* Second member email addr (leave blank if none) */
};

/***************
 * ROTATE KERNEL
 ***************/

/******************************************************
 * Your different versions of the rotate kernel go here
 ******************************************************/

/* 
 * naive_rotate - The naive baseline version of rotate 
 */
char naive_rotate_descr[] = "naive_rotate: Naive baseline implementation";
void naive_rotate(int dim, pixel *src, pixel *dst) 
{
    int i, j;

    for (i = 0; i < dim; i++)
	for (j = 0; j < dim; j++)
	    dst[RIDX(dim-1-j, i, dim)] = src[RIDX(i, j, dim)];
}

/* 
 * rotate - Your current working version of rotate
 * IMPORTANT: This is the version you will be graded on
 */
char rotate_descr[] = "rotate: Current working version";
void rotate(int dim, pixel *src, pixel *dst) 
{   
    int i,j,k;
    dst += (dim*dim - dim);
    for (i = 0; i < dim; i+=32) {
	    for (j = 0; j < dim; j++) {
            for (k = 0; k < 32; k++) {
                dst[k] = src[k * dim];
            }
            src++;      //j++ => src+=1
            dst-=dim;   //j++ => dim+=-dim
        }
        //i+=32 => src+=32*dim, then neutralize the effects of for(j)
        src+=31*dim;
        //i+=32 => dst+=32, then neutralize the effects of for(j)
        dst+=dim*dim+32;
    }
}

/*********************************************************************
 * register_rotate_functions - Register all of your different versions
 *     of the rotate kernel with the driver by calling the
 *     add_rotate_function() for each test function. When you run the
 *     driver program, it will test and report the performance of each
 *     registered test function.  
 *********************************************************************/

void register_rotate_functions() 
{
    add_rotate_function(&naive_rotate, naive_rotate_descr);   
    add_rotate_function(&rotate, rotate_descr);   
    /* ... Register additional test functions here */
}


/***************
 * SMOOTH KERNEL
 **************/

/***************************************************************
 * Various typedefs and helper functions for the smooth function
 * You may modify these any way you like.
 **************************************************************/

/* A struct used to compute averaged pixel value */
typedef struct {
    int red;
    int green;
    int blue;
    int num;
} pixel_sum;

/* Compute min and max of two integers, respectively */
static int min(int a, int b) { return (a < b ? a : b); }
static int max(int a, int b) { return (a > b ? a : b); }

/* 
 * initialize_pixel_sum - Initializes all fields of sum to 0 
 */
static void initialize_pixel_sum(pixel_sum *sum) 
{
    sum->red = sum->green = sum->blue = 0;
    sum->num = 0;
    return;
}

/* 
 * accumulate_sum - Accumulates field values of p in corresponding 
 * fields of sum 
 */
static void accumulate_sum(pixel_sum *sum, pixel p) 
{
    sum->red += (int) p.red;
    sum->green += (int) p.green;
    sum->blue += (int) p.blue;
    sum->num++;
    return;
}

/* 
 * assign_sum_to_pixel - Computes averaged pixel value in current_pixel 
 */
static void assign_sum_to_pixel(pixel *current_pixel, pixel_sum sum) 
{
    current_pixel->red = (unsigned short) (sum.red/sum.num);
    current_pixel->green = (unsigned short) (sum.green/sum.num);
    current_pixel->blue = (unsigned short) (sum.blue/sum.num);
    return;
}

/* 
 * avg - Returns averaged pixel value at (i,j) 
 */
static pixel avg(int dim, int i, int j, pixel *src) 
{
    int ii, jj;
    pixel_sum sum;
    pixel current_pixel;

    initialize_pixel_sum(&sum);
    for(ii = max(i-1, 0); ii <= min(i+1, dim-1); ii++) 
	for(jj = max(j-1, 0); jj <= min(j+1, dim-1); jj++) 
	    accumulate_sum(&sum, src[RIDX(ii, jj, dim)]);

    assign_sum_to_pixel(&current_pixel, sum);
    return current_pixel;
}

/******************************************************
 * Your different versions of the smooth kernel go here
 ******************************************************/

/*
 * naive_smooth - The naive baseline version of smooth 
 */
char naive_smooth_descr[] = "naive_smooth: Naive baseline implementation";
void naive_smooth(int dim, pixel *src, pixel *dst) 
{
    int i, j;

    for (i = 0; i < dim; i++)
	for (j = 0; j < dim; j++)
	    dst[RIDX(i, j, dim)] = avg(dim, i, j, src);
}

pixel_sum p_sum[512][512];
static void three_pixel_sum(pixel_sum *sum, pixel a, pixel b, pixel c)
{
    sum->red=(int)(a.red+b.red+c.red);
    sum->green=(int)(a.green+b.green+c.green);
    sum->blue=(int)(a.blue+b.blue+c.blue);
}
static void two_pixel_sum(pixel_sum *sum, pixel a, pixel b){
    sum->red=(int)(a.red+b.red);
    sum->blue=(int)(a.blue+b.blue);
    sum->green=(int)(a.green+b.green);
}
static void add_pixel_sum(pixel_sum *a, pixel_sum b){
    a->red+=b.red;
    a->green+=b.green;
    a->blue+=b.blue;
}
static void sum2pixel(pixel *current_pixel, pixel_sum sum, int num)
{
    current_pixel->red = (unsigned short)(sum.red / num);
    current_pixel->green = (unsigned short)(sum.green / num);
    current_pixel->blue = (unsigned short)(sum.blue / num);
    return;
}

/*
 * smooth - Your current working version of smooth. 
 * IMPORTANT: This is the version you will be graded on
 */
char smooth_descr[] = "smooth: Current working version";
void smooth(int dim, pixel *src, pixel *dst) 
{
    pixel_sum sum;
    int r,c;
    int dimsubone=dim-1;
    //初始化
    for(r=0;r<dim;r++){
        for(c=0;c<dim;c++){
            initialize_pixel_sum(&p_sum[r][c]);
        }
    }
    //计算中间部分
    for(r=1;r<dimsubone;r++){
        for(c=1;c<dimsubone;c++){
            three_pixel_sum(&sum,src[RIDX(r,c-1,dim)],src[RIDX(r,c,dim)],src[RIDX(r,c+1,dim)]);
            add_pixel_sum(&p_sum[r-1][c],sum);
            add_pixel_sum(&p_sum[r][c],sum);
            add_pixel_sum(&p_sum[r+1][c],sum);
        }
    }
    //计算上下两边
    for(c=1;c<dimsubone;c++){
        three_pixel_sum(&sum,src[RIDX(0,c-1,dim)],src[RIDX(0,c,dim)],src[RIDX(0,c+1,dim)]);
        add_pixel_sum(&p_sum[0][c],sum);
        add_pixel_sum(&p_sum[1][c],sum);
        three_pixel_sum(&sum,src[RIDX(dimsubone,c-1,dim)],src[RIDX(dimsubone,c,dim)],src[RIDX(dimsubone,c+1,dim)]);
        add_pixel_sum(&p_sum[dim-2][c],sum);
        add_pixel_sum(&p_sum[dimsubone][c],sum);
    }
    //计算左右两边
    for(r=1;r<dimsubone;r++){
        two_pixel_sum(&sum,src[RIDX(r,0,dim)],src[RIDX(r,1,dim)]);
        add_pixel_sum(&p_sum[r-1][0],sum);
        add_pixel_sum(&p_sum[r][0],sum);
        add_pixel_sum(&p_sum[r+1][0],sum);
        two_pixel_sum(&sum,src[RIDX(r,dim-2,dim)],src[RIDX(r,dimsubone,dim)]);
        add_pixel_sum(&p_sum[r-1][dimsubone],sum);
        add_pixel_sum(&p_sum[r][dimsubone],sum);
        add_pixel_sum(&p_sum[r+1][dimsubone],sum);
    }
   //计算四角
  two_pixel_sum(&sum,src[RIDX(0,0,dim)],src[RIDX(0,1,dim)]);
    add_pixel_sum(&p_sum[0][0],sum);
    add_pixel_sum(&p_sum[1][0],sum);
    two_pixel_sum(&sum,src[RIDX(0,dim-2,dim)],src[RIDX(0,dimsubone,dim)]);
    add_pixel_sum(&p_sum[0][dimsubone],sum);
    add_pixel_sum(&p_sum[1][dimsubone],sum);
    two_pixel_sum(&sum,src[RIDX(dimsubone,0,dim)],src[RIDX(dimsubone,1,dim)]);
    add_pixel_sum(&p_sum[dim-2][0],sum);
    add_pixel_sum(&p_sum[dimsubone][0],sum);
    two_pixel_sum(&sum,src[RIDX(dimsubone,dim-2,dim)],src[RIDX(dimsubone,dimsubone,dim)]);
    add_pixel_sum(&p_sum[dim-2][dimsubone],sum);
    add_pixel_sum(&p_sum[dimsubone][dimsubone],sum);
    //中部有9个相邻点
    for(r=1;r<dimsubone;r++){
        for(c=1;c<dimsubone;c++){
            sum2pixel(&dst[RIDX(r,c,dim)],p_sum[r][c],9);
        }
        sum2pixel(&dst[RIDX(r,0,dim)],p_sum[r][0],6);
        sum2pixel(&dst[RIDX(r,dimsubone,dim)],p_sum[r][dimsubone],6);
    }
    //四边有6个相邻点
    for(c=1;c<dimsubone;c++){
        sum2pixel(&dst[RIDX(0,c,dim)],p_sum[0][c],6);
        sum2pixel(&dst[RIDX(dimsubone,c,dim)],p_sum[dimsubone][c],6);
    }
    //四角有4个相邻点
    sum2pixel(&dst[RIDX(0,0,dim)],p_sum[0][0],4);
    sum2pixel(&dst[RIDX(dimsubone,0,dim)],p_sum[dimsubone][0],4);
    sum2pixel(&dst[RIDX(0,dimsubone,dim)],p_sum[0][dimsubone],4);
    sum2pixel(&dst[RIDX(dimsubone,dimsubone,dim)],p_sum[dimsubone][dimsubone],4);
}


/********************************************************************* 
 * register_smooth_functions - Register all of your different versions
 *     of the smooth kernel with the driver by calling the
 *     add_smooth_function() for each test function.  When you run the
 *     driver program, it will test and report the performance of each
 *     registered test function.  
 *********************************************************************/

void register_smooth_functions() {
    add_smooth_function(&smooth, smooth_descr);
    add_smooth_function(&naive_smooth, naive_smooth_descr);
    /* ... Register additional test functions here */
}

