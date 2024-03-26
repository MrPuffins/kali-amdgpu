# KALI AMDGPU SUPPORT DRIVERS FOR HASHCAT
How to install kali amdgpu for hashcat
[Click here to jump to the installation script](#installation)

# TESTED on rx6900 xt
First, download the corresponding gpu driver from the amd official driver selection tool

https://www.amd.com/en/support
(for example: https://www.amd.com/en/support/graphics/amd-radeon-6000-series/amd-radeon-6900-series/amd-radeon-rx-6900-xt)

Choose : Radeon™ Software for Linux® version 23.40.2 for Ubuntu 22.04.4 HWE

or:```wget https://repo.radeon.com/amdgpu-install/23.40.2/ubuntu/jammy/amdgpu-install_6.0.60002-1_all.deb```

Install the amdgpu-install script
```sudo apt install -y ./amdgpu-install_6.0.60002-1_all.deb```

Then edit the script:
```sudo nano /usr/bin/amdgpu-install```

if you do not find the script, do ```find / -name amdgpu-install```

Find this line: 
```ubuntu|linuxmint|debian)```
(to do it quickly do ```CTRL+W os_release```)

Add "kali" to the end of the line
ex: ```ubuntu|linuxmint|debian|kali)```

CTRL+X, Y to save and exit nano

finally:
```amdgpu-install --no-dkms --usecase=opencl```

to check: ```hashcat -I```
```hashcat -I                                
hashcat (v6.2.6) starting in backend information mode

OpenCL Info:
============

OpenCL Platform ID #1
  Vendor..: The pocl project
  Name....: Portable Computing Language
  Version.: OpenCL 3.0 PoCL 5.0+debian  Linux, None+Asserts, RELOC, SPIR, LLVM 16.0.6, SLEEF, DISTRO, POCL_DEBUG

  Backend Device ID #1
    Type...........: CPU
    Vendor.ID......: 1
    Vendor.........: AuthenticAMD
    Name...........: cpu-skylake-avx512-AMD Ryzen 7 7700X 8-Core Processor
    Version........: OpenCL 3.0 PoCL HSTR: cpu-x86_64-pc-linux-gnu-skylake-avx512
    Processor(s)...: 16
    Clock..........: 5573
    Memory.Total...: 29194 MB (limited to 4096 MB allocatable in one block)
    Memory.Free....: 14565 MB
    Local.Memory...: 1024 KB
    OpenCL.Version.: OpenCL C 1.2 PoCL
    Driver.Version.: 5.0+debian

OpenCL Platform ID #2
  Vendor..: Advanced Micro Devices, Inc.
  Name....: AMD Accelerated Parallel Processing
  Version.: OpenCL 2.1 AMD-APP (3602.0)

  Backend Device ID #2
    Type...........: GPU
    Vendor.ID......: 1
    Vendor.........: Advanced Micro Devices, Inc.
    Name...........: AMD Radeon RX 6900 XT
    Version........: OpenCL 2.0 
    Processor(s)...: 40
    Clock..........: 2660
    Memory.Total...: 16368 MB (limited to 13912 MB allocatable in one block)
    Memory.Free....: 16256 MB
    Local.Memory...: 64 KB
    OpenCL.Version.: OpenCL C 2.0 
    Driver.Version.: 3602.0 (HSA1.1,LC)
    PCI.Addr.BDF...: 03:00.0

  Backend Device ID #3
    Type...........: GPU
    Vendor.ID......: 1
    Vendor.........: Advanced Micro Devices, Inc.
    Name...........: AMD Radeon Graphics
    Version........: OpenCL 2.0 
    Processor(s)...: 1
    Clock..........: 2200
    Memory.Total...: 512 MB (limited to 384 MB allocatable in one block)
    Memory.Free....: 384 MB
    Local.Memory...: 64 KB
    OpenCL.Version.: OpenCL C 2.0 
    Driver.Version.: 3602.0 (HSA1.1,LC)
    PCI.Addr.BDF...: 12:00.0
```
there ya go! 

<a id="installation"></a>
# HOW TO USE MY SCRIPT

```git clone https://github.com/MrPuffins/kali-amdgpu.git```

```cd kali-amdgpu```

```sudo chmod +x ./install.sh```

```sudo ./install.sh```
