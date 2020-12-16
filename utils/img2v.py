#!/usr/bin/env python3
# convert image to verilog memory initialization file
import sys
from PIL import Image

def main():
    if len(sys.argv) != 3:
        print("Usage: img2v.py [image] [output]")
        exit(-1)

    with open (sys.argv[2], "w") as output_f:
        img = Image.open(sys.argv[1])
        width, height = img.size
        print(img.size)

        for y in range(height):
            for x in range(width):
                coord = x, y
                r, g, b, a = img.getpixel(coord)
                
                if r > 100 or g > 100 or b > 100:
                    output_f.write("ff\n")
                else:
                    output_f.write("00\n")

if __name__ == "__main__":
    main()
