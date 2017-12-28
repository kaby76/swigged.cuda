# Building and Running Sample Swigged.CUDA Program

1) You can build and run this program without building
Swigged.CUDA. Reference to the Swigged.CUDA assembly is
accomplished using Nuget. However, if you are interested
in testing a local copy of Swigged.CUDA,
use a local Nuget server, e.g., Proget, then reference
that server within Visual Studio (Solution Explorer => right click
Manage NuGet Packages ..., and change the Package Source--you may
need to change options in VS to add a new NuGet server). You should
not explicitly change the "References" for the C# program to
rely on the local copy of Swigged.CUDA somewhere on disk.

2) After opening ConsoleApp1.sln in VS 2017, select "Menu | Rebuild".
Note, Project2 is a CUDA Runtime API program that should work. To verify,
right-click on the project name in the Solution Explorer, and Debug.
It should output "Hello world". The C# program
depends on that program building and running correctly, using both the
PTX that is generated for the build of Project2, and the .OBJ file.
The C# program will call the kernel as PTX then CUBIN.
Note that NVIDIA CUDA 9 is phasing out 32-bit support, so you
should be built for a 64-bit target.

3) "F5".