/*
Author: Ian Taylor
This module takes in an x and y location for a pixel in a 300 x 300 resolution image
Each pixel is 3 bytes, each address space in memory holds 1 byte.
It then determines the starting address of that pixel in the memory array.
*/
module pixel_memarray ( PixelX, PixelY, pixel_address);
	
  	int x = 900;	//Each pixel takes up 3 bytes. each row has 300 pixels. 900 bytes per row
  	int y = 300;	//300 rows of pixels
  	input logic [0:8]PixelX, PixelY; 			//Need 9 pixels for both the coordinate x and y. Both coordinate have range [0,299].
  	output logic [0:19]pixel_address;			//needs to be 20 bits wide to reach all of the 90,000 pixel addresses in memory. The last pixel address starts at 269,997
  												//Total memory space needed for this image is 270,000
 
  	//Find the memory address of the pixel in the 300 x 300 image
  	assign pixel_address = (PixelX*3) + (PixelY*x);

endmodule



/* 
Author: Ian Taylor
Testbench for the pixel to mem array address module
The x and y pixels are stored as parameters that can be overwitten by the user.
*/


// Testbench for pixel_memarray module
module pixel_memarray_TB;
  parameter x = 300, y = 300;		//User input, can overwrite these parameters
  
  reg [0:8]PixelX;				//Need 9 bits to cover the range of 0 to 299 for the pixel x coordinate
  reg [0:8]PixelY;				//Need 9 bits to cover the range of 0 to 299 pixels for y coordinate
  wire [0:19]pixel_address;		//Need 20 bits to cover all 90,000 pixel addresses in memory. The last
  								//pixel address is 269,997
  
  // Instantiate pixel_memarray
  pixel_memarray mem(.PixelX(PixelX), .PixelY(PixelY),
               .pixel_address(pixel_address));
          
  initial begin
    PixelX = x;		//set pixel x coordinate to user defined parameter x
    PixelY = y;		//set pixel y coordinate to user defined parameter y
  
    //Image has a resolution of 300 x 300
    //Range is [0, 299] If x or y coordinate exceeds the 300th pixel, set back to 299 (300th pixel)
    if (PixelX >= 300) begin
   		PixelX = 299;
  	end
    if (PixelY >= 300) begin
   		PixelY = 299;
  	end
    
    display;	//Display results
  end	
  
  	//Displays the (x,y) pixel position chosen by user, and the pixel's starting address in memory
  	task display;
      #1 $display("Pixel X Coordinate:%d, Pixel Y Coordinate:%d, pixel_address:%d",
    	PixelX, PixelY, pixel_address);
  	endtask
  
endmodule