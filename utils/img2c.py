#!/usr/bin/env python3
import sys
from PIL import Image

def main():
    if len(sys.argv) != 3:
        print("Usage: img2c.py [image] [output]")
        exit(-1)

    with open (sys.argv[2], "w") as output_f:
        img = Image.open(sys.argv[1])
        width, height = img.size

        output_f.write(f"const uint8_t img[{width}*{height}] = ")
        output_f.write("{\n")
        for y in range(height):
            for x in range(width):
                coord = x, y
                r, g, b, a = img.getpixel(coord)
                
                if r > 100 or g > 100 or b > 100:
                    output_f.write("0xff")
                else:
                    output_f.write("0x00")

                if not (y == (height - 1) and x == (width - 1)):
                    output_f.write(",")
            output_f.write("\n")
        output_f.write("};")

if __name__ == "__main__":
    main()
