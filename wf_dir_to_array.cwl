#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: Workflow

doc: |
  Workflow with 2 steps: step 1 produces a directory and the step 2 takes a file array as input. 
  Therefore, the directory has to be converted to a file array.

requirements:
  StepInputExpressionRequirement: {} # because valueFrom is specified

inputs:
  filenames_array: 
    type: string[]
    default: [ '1.txt', '2.txt' ]

outputs: []

steps:
  create_files:
    in:
      file_name: filenames_array
    out: [ new_directory ]
    run: ./touch_array.cwl
  echo_files:
    in:
      input_array: 
        source: create_files/new_directory
        valueFrom: $(self.listing) # self = the value of create_files/new_directory. listing = all files in directory
    out: []
    run: ./echo.cwl





