#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: CommandLineTool
baseCommand: [cd]

inputs:
  directory: 
    type: Directory
    inputBinding:
      position: 1

outputs: []



