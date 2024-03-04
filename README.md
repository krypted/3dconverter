# 3dconverter

This is a project to test how RealityKit works. In its current state, it can convert .stl files to .obj and .obj to .stl. Hoping to get it to also do either to usdz and back, to support getting objects into Vision Pro apps. It uses assimp, so to start:

`brew install assimp`

After installing assimp, run one more command to build the code (assuming Xcode is installed and the code here is downloaded into the current working directory): 

`swift build`

After built, grab the new binary from the .build folder, or if the working directory is the same just use the command:

`./.build/debug/STLtoOBJConverter Parameter_1 path_to_input_file path_to_output_file`

The optional parameters are `--obj-to-stl ` and `--stl-to-obj`

So for example, to convert ~/dragon.stl to ~/dragon.obj:

`./.build/debug/STLtoOBJConverter --stl-to-obj ~/dragon.stl ~/dragon.obj`

There are plenty of python scripts out there to do things like this, but the goal here was to use RealityKit and have it be native switf. As mentioned, the second goal is to also do .usdz, but that's a bit more challenging; thus far, at least.
