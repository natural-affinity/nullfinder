NullFinder
==========
This script serves as a means to detect the presence
of NULL bytes in any file.  Specifically, it will recursively
search a target directory for files that match a given pattern for NULL bytes.

Prerequisites
-------------
* Korn Shell (ksh)
* Bourne Shell (sh)
* Bourne Again Shell (bash)


Supported Platforms
-------------------
* AIX
* Linux
* Mac OSX
* Unix Variants


Usage and documentation
-----------------------
NullFinder is a command line application. Please open a terminal to your the
project directory.  

### Setup

Ensure ksh or a compatible shell is available on your system:  
```bash
$ which ksh bash sh
```

Modify the shebang line of the script if using another shell (i.e. bash, sh):  
```bash
!#/bin/sh
!#/bin/bash
```

Ensure NullFinder has execute permissions:  
```bash
$ chmod +x nullfinder.sh
```

### Usage

You can get a description of available tasks by invoking the 'help' task:  
```bash
$ ./nullfinder.sh --help|-h
```

You must search for files that match a specific pattern in a target directory:  
```bash
$ ./nullfinder.sh -p <pattern> -d <directory>
```

You should ensure all filename patterns are correctly escaped:  
```bash
$ ./nullfinder.sh -p \*.xsd -d <directory>
```

The target directory path should be is absolute:  
```bash
$ ./nullfinder.sh -p \*.xsd -d /workspace/schemas
```

However the target directory path can also be an immediate sub-directory:  
```bash
$ ./nullfinder.sh -p \*.xsd -d schemas
```


License
-------
Released under the MIT License.  See the LICENSE file for further details.
