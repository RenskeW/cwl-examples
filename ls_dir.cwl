#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: CommandLineTool

baseCommand: ls

requirements:
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:
    listing: |
      ${
           return [{"entry": {"class": "Directory", "basename": inputs.index_dir, "listing": inputs.file_array}, "writable": true}]
       }

arguments:
- $(inputs.index_dir)

inputs:
  file_array:
    type: File[]
  index_dir:
    type: string
    default: "index_dir_value"

outputs:
  created_dir:
    type: Directory
    outputBinding:
      glob: $(inputs.index_dir)
