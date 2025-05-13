cwlVersion: v1.2
class: CommandLineTool

baseCommand: python

arguments:
- $(inputs.wrapper)
- --function=workflow.get_sum
- --arg_x=$(inputs.x_file) 
- --arg_y=$(inputs.y_file)

requirements:
  InitialWorkDirRequirement:
    listing:
      - $(inputs.x_file)
      - $(inputs.y_file)

inputs:
  wrapper:
    type: File
    inputBinding:
      position: 1
    default:
      class: File
      location: wrapper.py
  x_file:
    type: File
  y_file:
    type: File

outputs:
  result_file:
    type: File
    outputBinding:
      glob: result.pickle
