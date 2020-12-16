#!/usr/bin/env python3
# Convert a font to a C bitmap array
# Joseph Ravichandran
# Designed for pwnyOS
# Modified for pretty-secure-processor project
import sys
import string
from PIL import ImageDraw, ImageFont, Image

# Fonts are encoded as the following bitmask:
# 1 byte = 1 pixel
# 00 = totally blank, 01 = dark, 10 = grey, 11 = full color

if __name__ == "__main__":
    if (len(sys.argv) != 3):
        print("Error: Usage is fontconvert.py (name of font) (name of output file)")
        exit(-1)

    font_file = sys.argv[1]
    output_filename = sys.argv[2]

    img = Image.new("RGB", (300,300))
    draw = ImageDraw.Draw(img)
    font = ImageFont.truetype(font_file, 12) # 96 for larger fonts, 148 for smaller ones
    output_file = open(output_filename, "w")

    # Get top-left and bottom-right corner of possible font positions
    maxwidth = 0
    maxheight = 0
    maxtop = 1000000000
    maxleft = 1000000000
    maxbottom = 0
    maxright = 0
    for char_draw_idx in range(256):
        width, height = font.getmask(chr(char_draw_idx)).size

        char_draw = chr(char_draw_idx)
        draw.text((0,0), char_draw, font=font)

        # Get bounding box:
        right, bottom = font.getsize(char_draw)
        top = bottom - height
        left = right - width

        # Draw red box around letter:
        #draw.rectangle((left,top,right,bottom), None, "#f00")

        mask = (width,height)

        if (right > maxright):
            maxright = right
        if (left < maxleft):
            maxleft = left
        if (top < maxtop):
            maxtop = top
        if (bottom > maxbottom):
            maxbottom = bottom
        if (width > maxwidth):
            maxwidth = width
        if (height > maxheight):
            maxheight = height

    maxwidth = (maxright - maxleft)
    maxheight = (maxbottom - maxtop)

    draw.rectangle((0, 0, 300, 300), fill=(0,0,0,0))

    # Create C buffers:
    width = maxwidth
    height = maxheight
    output_file.write("#define FONT_WIDTH {}\n".format(width))
    output_file.write("#define FONT_HEIGHT {}\n".format(height))

    chars_to_draw = (string.ascii_letters + " " + string.digits + string.punctuation)
    output_file.write("static const char fontmap[256] = {")
    for idx in range(256):
        if (chr(idx) in chars_to_draw):
            output_file.write(str(chars_to_draw.find(chr(idx))))
        else:
            output_file.write("0")
        if (idx == 255):
            output_file.write("};\n")
        else:
            output_file.write(",")

    print("Alphabet: {}".format(chars_to_draw))
    print("({}, {})".format(width, height))
    print("Total storage required: {} bytes".format(len(chars_to_draw) * width * height / 4))

    output_file.write("static const char font[{}][{}] = {{".format(len(chars_to_draw),width*height))
    #for char_draw_idx in "g":
    chars_drawn = 0
    for char_draw_idx in chars_to_draw:
        char_draw = char_draw_idx

        draw.text((0,0), char_draw, font=font)

        # Get bounding box:
        right, bottom = font.getsize(char_draw)

        # For now, fonts are fixed-width:
        # @TODO: Use this here to make fonts varible width
        #width, height = font.getmask(char_draw).size

        #top = bottom - height
        #left = right - width
        top = maxtop
        left = maxleft

        # Draw red box around letter:
        #draw.rectangle((maxleft,maxtop,maxright,maxbottom), None, "#f00")

        mask = (maxwidth,maxheight)
        output_file.write("{")
        for j in range(mask[1]):
            for i in range(mask[0]):
                # Iterate over the 4 points we are condensing into a single byte:
                byte_write = 0

                x = i + left
                y = j + top
                cur_pix = img.getpixel((x, y))
                #draw.rectangle((x,y,x,y), fill=(255,255,255,255))

                # White font has same color for R,G,B channels:
                cur_lum = cur_pix[0]

                # Can adjust these as needed
                cur_lum_px = 0
                if (cur_lum < 1*(255/4)):
                    cur_lum_px = 0
                elif (cur_lum < 2*(255/4)):
                    cur_lum_px = 1
                elif (cur_lum < 3*(255/4)):
                    cur_lum_px = 2
                else:
                    cur_lum_px = 3

                byte_write = cur_lum_px

                # Write this single pixel into array:
                output_file.write("{}".format(byte_write))
                if (j != (mask[1] - 1) or i != mask[0] - 1):
                    output_file.write(", ")
                else:
                    if (chars_drawn == len(chars_to_draw) - 1):
                        output_file.write("} };")
                    else:
                        output_file.write("},")

        # img.show()

        # Clear image for next character
        draw.rectangle((0, 0, 300, 300), fill=(0,0,0,0))

        chars_drawn += 1
