# Memories
These are memory initialization files that can be used by the Pretty Secure Processor.

`font.mem` is an encoded version of Adobe Font's Open-Source "Source Code Pro" font converted with `img2v.py`.

`splashscreen.mem` is an initializer file for text-mode RAM that contains a popup box saying "Pretty Secure Processor"

`logo.mem` is the Pretty Secure Processor logo encoded as a 120 by 120 image, ready to be used as a hardware sprite.

# Vivado Usage
To use these files in Vivado, add them as simulation sources and they can be included with `$readmemh` directly (no absolute path required!)
