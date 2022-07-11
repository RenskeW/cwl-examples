# CWL examples

This repository contains example workflows in CWL.

## Overview
### Convert output of type Directory into input of type File array
- `wf_dir_to_array.cwl`: Source = Directory, Sink = File[], no scatter
- `wf_dir_to_array_scatter.cwl`: Source = Directory, Sink = File[], but tool in Sink takes File. Solution 1 = nested workflow (maybe not the best practice).

### Convert output of type File[] into input of type Directory
- `ls_dir.cwl`: Tool which takes file array as input and converts this to a Directory before execution.


## License
Apache-2.0

