#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: Workflow

doc: |
  Workflow which converts file array to directory first since step takes type Directory.
requirements:
  InlineJavascriptRequirement: {}

inputs:
  file_array: File[]
  input_dir: []

outputs: []

steps:
  cd_dir:
    requirements:
      InitialWorkDirRequirement:
        listing:
        - entryname: hello
          entry: |
           ${
                return [{"entry": {"class": "Directory", "basename": inputs.input_dir, "listing": inputs.file_array}, "writable": true}]
            }       
    in:
      directory: input_dir
    out: []
    run: ./cd_dir.cwl




