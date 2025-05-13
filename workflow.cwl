cwlVersion: v1.2
class: CommandLineTool

baseCommand: python

inputs:
  wrapper:
    type: File
    inputBinding:
      position: 1
    default:
      class: File
      location: wrapper.py
  function:
    type: string
    default: workflow.get_sum
    inputBinding:
      prefix: --function=
      separate: false
      position: 2
  x_file:
    type: File
    inputBinding:
      prefix: --arg_x=
      separate: false
      position: 3
  y_file:
    type: File
    inputBinding:
      prefix: --arg_y=
      separate: false
      position: 4    

outputs:
  result_file:
    type: File
    outputBinding:
      glob: result.pickle

