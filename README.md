# Python Workflow in Common Workflow Language
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/jan-janssen/python-cwl-workflow/HEAD?urlpath=%2Fdoc%2Ftree%2Fworkflow.ipynb)

## Python 
The following two Python functions should be executed with the common workflow language (CWL):
```python
def get_sum(x, y):
    return x + y
    
def get_prod_and_div(x: float, y: float) -> dict:
    return {"prod": x * y, "div": x / y}
```

An example call could look like this:
```python
tmp_dict = get_prod_and_div(x=1, y=2)
print(get_sum(x=tmp_dict["prod"], y=tmp_dict["div"]))
```

## Common Workflow Language 
After the wrappers for the [get_sum()](get_sum.cwl) and [get_prod_and_div()](get_prod_and_div.cwl) functions are defined in the CWL, the workflow can be written as:
```CWL
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
```
