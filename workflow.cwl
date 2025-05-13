cwlVersion: v1.2
class: Workflow

inputs:
  x_file: File
  y_file: File

steps:
  get_prod_and_div:
    run: get_prod_and_div.cwl
    in:
      x_file: x_file
      y_file: y_file
    out: [prod_file, div_file]

  get_sum:
    run: get_sum.cwl
    in: 
      x_file: get_prod_and_div/prod_file
      y_file: get_prod_and_div/div_file
    out: [result_file]

outputs:
  result_file:
    type: File
    outputSource: get_sum/result_file
