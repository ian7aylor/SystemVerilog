Image is stored in memory
1 pixel is 3 bytes, each address space has 1 byte
In memory you will have address space for beginning of image

Module memarray #(parameter Ux = 50, Uy = 50)();
	Logic X, Y, Ux, Uy, pixel_address;
	Reg [2:0] pixel data;
	Reg memarray [X][Y];  //# of byte sized addresses in memory

	Y = 900;     //# of columns
	X = 300;    //# of rows

	//Algorithm for getting the address in memory
	
	//Assigns 
	assign pixel_address = (Ux*X) + (Uy*Y);  
	[2:0] pixel_data = memarray[X*(Ux/X)][U];

endmodule
}


module TB ();






endmodule 