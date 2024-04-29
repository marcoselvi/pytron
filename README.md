# pytron

Pytron is an environmentless Python interpreter.
It relies on `.pytron` config files at the system level, in project folders, or even jointly with individual scripts, to build cached hidden environments which are linked dynamically when a script is run with Pytron.

The first time you run a script with Pytron the background environment caching will downlad the needed libraries based on the config file, add the library directory to the `sys.path`, and run the script as normal.
As long as the config doesn't change, following executions will run in the cached environment without needing any extra manual operations.
Updates to the config (either changing the version of a dependency, or adding / removing dependencies) will cause the environment to be updated at the next run.

## Installation

### Pytron dependencies

## Usage

### Configuration
