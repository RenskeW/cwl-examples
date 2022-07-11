#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: CommandLineTool

baseCommand: echo


inputs:
  input_array: 
    type: File[]
    inputBinding:
      position: 1


outputs: []



