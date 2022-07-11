#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: Workflow

doc: |
  Workflow with 2 steps: step 1 produces a directory and step 2 is a nested workflow with 1 step which takes a File as input.

requirements:
  StepInputExpressionRequirement: {} # because valueFrom is specified
  SubworkflowFeatureRequirement: {} # because workflow contains a nested workflow

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
  print_date_files:
    in:
      input_array: 
        source: create_files/new_directory
        valueFrom: $(self.listing) # self = the value of create_files/new_directory. listing = all files in directory
    out: []
    run:
      class: Workflow
      inputs:
        input_array: File[]
      outputs: []
      steps:
        print_date:
          run: ./date.cwl # takes File as input
          in: 
            file: input_array
          out: []
          scatter: file
      requirements:
        ScatterFeatureRequirement: {}







