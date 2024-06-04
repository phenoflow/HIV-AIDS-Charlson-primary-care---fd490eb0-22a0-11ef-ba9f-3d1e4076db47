cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  hiv-aids-charlson-primary-care---primary:
    run: hiv-aids-charlson-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  hiv-aids-charlson-primary-care-immunodef---primary:
    run: hiv-aids-charlson-primary-care-immunodef---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: hiv-aids-charlson-primary-care---primary/output
  hiv-aids-charlson-primary-care-deficiency---primary:
    run: hiv-aids-charlson-primary-care-deficiency---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: hiv-aids-charlson-primary-care-immunodef---primary/output
  hiv-aids-charlson-primary-care-neopl---primary:
    run: hiv-aids-charlson-primary-care-neopl---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: hiv-aids-charlson-primary-care-deficiency---primary/output
  hiv-aids-charlson-primary-care-nurse---primary:
    run: hiv-aids-charlson-primary-care-nurse---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: hiv-aids-charlson-primary-care-neopl---primary/output
  hiv-aids-charlson-primary-care-abnormsnec---primary:
    run: hiv-aids-charlson-primary-care-abnormsnec---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: hiv-aids-charlson-primary-care-nurse---primary/output
  hiv-aids-charlson-primary-care-unspecified---primary:
    run: hiv-aids-charlson-primary-care-unspecified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: hiv-aids-charlson-primary-care-abnormsnec---primary/output
  other-hiv-aids-charlson-primary-care---primary:
    run: other-hiv-aids-charlson-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: hiv-aids-charlson-primary-care-unspecified---primary/output
  hiv-aids-charlson-primary-care-resulting---primary:
    run: hiv-aids-charlson-primary-care-resulting---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: other-hiv-aids-charlson-primary-care---primary/output
  aids---primary:
    run: aids---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: hiv-aids-charlson-primary-care-resulting---primary/output
  multiple-hiv-aids-charlson-primary-care---primary:
    run: multiple-hiv-aids-charlson-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: aids---primary/output
  hiv-aids-charlson-primary-care-pneumonia---primary:
    run: hiv-aids-charlson-primary-care-pneumonia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: multiple-hiv-aids-charlson-primary-care---primary/output
  viral-hiv-aids-charlson-primary-care---primary:
    run: viral-hiv-aids-charlson-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: hiv-aids-charlson-primary-care-pneumonia---primary/output
  hiv-aids-charlson-primary-care-tissu---primary:
    run: hiv-aids-charlson-primary-care-tissu---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: viral-hiv-aids-charlson-primary-care---primary/output
  parasitic-hiv-aids-charlson-primary-care---primary:
    run: parasitic-hiv-aids-charlson-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: hiv-aids-charlson-primary-care-tissu---primary/output
  hiv-aids-charlson-primary-care-unspcf---primary:
    run: hiv-aids-charlson-primary-care-unspcf---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: parasitic-hiv-aids-charlson-primary-care---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: hiv-aids-charlson-primary-care-unspcf---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
