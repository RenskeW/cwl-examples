#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: CommandLineTool

baseCommand: touch

inputs:
  file_name: 
    type: string[]
    inputBinding: 
      position: 1

outputs: 
  new_directory:
    type: Directory
    outputBinding:
      glob: "."




