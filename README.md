# SDSC "mono" roll

## Overview

This roll bundles the mono C# and the F# compilers and runtimes.

For more information about Mono please visit the official web page:

- <a href="http://www.mono-project.com/" target="_blank">Mono</a> is an open
source, cross-platform, implementation of C# and the CLR that is binary
compatible with Microsoft.NET.

For more information about F# please visit <a href="http://fsharp.org">the
official project web page</a>.


## Requirements

To build/install this roll you must have root access to a Rocks development
machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must
download the appropriate mono source file(s) using a machine that does
have Internet access and copy them into the `src/<package>` directories on your
Rocks development machine.


## Dependencies

The sdsc-roll must be installed on the build machine, since the build process
depends on make include files provided by that roll.


## Building

To build the mono-roll, execute this on a Rocks development
machine (e.g., a frontend or development appliance):

```shell
% make 2>&1 | tee build.log
```

A successful build will create the file `mono-*.disk1.iso`.  If you built the
roll on a Rocks frontend, proceed to the installation step. If you built the
roll on a Rocks development appliance, you need to copy the roll to your Rocks
frontend before continuing with installation.


## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll mono
% cd /export/rocks/install
% rocks create distro
```

Subsequent installs of compute and login nodes will then include the contents
of the mono-roll.  To avoid cluttering the cluster frontend with unused
software, the mono-roll is configured to install only on compute and
login nodes. To force installation on your frontend, run this command after
adding the mono-roll to your distro

```shell
% rocks run roll mono host=NAME | bash
```

where NAME is the DNS name of a compute or login node in your cluster.

In addition to the software itself, the roll installs mono environment
module files in:

```shell
/opt/modulefiles/compilers/mono
```


## Testing

The mono-roll includes a test script which can be run to verify proper
installation of the roll documentation, binaries and module files. To
run the test scripts execute the following command(s):

```shell
% /root/rolltests/mono.t 
```
