# SDSC "mono" roll

## Overview

This roll bundles the mono C# compiler and runtime.

For more information about Mono please visit the official web page:

- <a href="http://www.mono-project.com/" target="_blank">Mono</a> is an open
source, cross-platform, implementation of C# and the CLR that is binary
compatible with Microsoft.NET.


## Requirements

To build/install this roll you must have root access to a Rocks development
machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must
download the appropriate mono source file(s) using a machine that does
have Internet access and copy them into the `src/<package>` directories on your
Rocks development machine.


## Dependencies

Unknown at this time.


## Building

To build the mono-roll, execute these instructions on a Rocks development
machine (e.g., a frontend or development appliance):

```shell
% make default 2>&1 | tee build.log
% grep "RPM build error" build.log
```

If nothing is returned from the grep command then the roll should have been
created as... `mono-*.iso`. If you built the roll on a Rocks frontend then
proceed to the installation step. If you built the roll on a Rocks development
appliance you need to copy the roll to your Rocks frontend before continuing
with installation.


## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll mono
% cd /export/rocks/install
% rocks create distro
% rocks run roll mono | bash
```

In addition to the software itself, the roll installs mono environment
module files in:

```shell
/opt/modulefiles/compilers/mono
```


## Testing

The mono-roll includes a test script which can be run to verify proper
installation of the mono-roll documentation, binaries and module files. To
run the test scripts execute the following command(s):

```shell
% /root/rolltests/mono.t 
ok 1 - mono is installed
ok 2 - mono test run
ok 3 - mono module installed
ok 4 - mono version module installed
ok 5 - mono version module link created
1..5
```