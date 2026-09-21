# DRISHTI — Prototype Workflow

## 1. Overview

The DRISHTI prototype implements a modular workflow for explainable diabetic retinopathy screening using **MATLAB and Simulink**.

The current MATLAB workflow processes retinal fundus images through:

```text
Fundus Image
     ↓
Image Quality Gate
     ↓
Image Enhancement
     ↓
DR Screening
     ↓
Explainability / Evidence
     ↓
Automated Report
```

The separate Simulink component models the rural telemedicine capacity workflow:

```text
Incoming Demand
     ↓
AI Screening
     ↓
Human Review
     ↓
Remaining Workload
     ↓
Backlog / Capacity Analysis
```

---

# 2. Current Prototype Scope

The current prototype uses:

* **APTOS 2019**
* Exactly **100 PNG retinal images**
* MATLAB for the image-processing and screening workflow
* MATLAB App Designer for the graphical interface
* Simulink for rural telemedicine capacity simulation

The prototype is an **academic/demo-level implementation**.

It is not clinically validated and should not be used for diagnosis or treatment decisions.

---

# 3. End-to-End Workflow

The complete current workflow is:

```text
                         ┌─────────────────────┐
                         │   FUNDUS IMAGE      │
                         │       INPUT         │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │  IMAGE QUALITY GATE │
                         │                     │
                         │ Focus / Blur        │
                         │ Brightness          │
                         │ Dark-region check   │
                         └──────────┬──────────┘
                                    │
                         ┌──────────┴──────────┐
                         │                     │
                       REJECT                ACCEPT
                         │                     │
                         ▼                     ▼
                  Recapture Feedback     Enhancement
                                               │
                                               ▼
                                      ┌─────────────────┐
                                      │ DR SCREENING    │
                                      │ ICDR-style 0–4 │
                                      └────────┬────────┘
                                               │
                                               ▼
                                      ┌─────────────────┐
                                      │ EXPLAINABILITY  │
                                      │                 │
                                      │ Evidence Maps   │
                                      └────────┬────────┘
                                               │
                                               ▼
                                      ┌─────────────────┐
                                      │ AUTOMATED       │
                                      │ REPORT          │
                                      └─────────────────┘
```

---

# 4. Step 1 — Fundus Image Input

The workflow begins with a retinal fundus image.

The current prototype dataset consists of:

```text
APTOS 2019
     │
     ▼
100-image subset
     │
     ▼
PNG retinal images
```

Images can be supplied through the MATLAB application or through the prototype execution workflow.

---

# 5. Step 2 — Image Quality Gate

The image-quality stage is implemented in:

```text
src/quality_gate.m
```

The purpose of this stage is to determine whether the input image is suitable for continuing through the screening workflow.

The current quality gate considers three main prototype-level characteristics:

### 5.1 Focus / Blur

The system evaluates an image-quality indicator related to image sharpness.

Very blurry images can be unsuitable for reliable retinal analysis.

### 5.2 Brightness

The image illumination is evaluated to identify images that may be excessively dark or otherwise unsuitable.

### 5.3 Dark-Region Analysis

The workflow also evaluates dark-region characteristics of the image.

---

# 6. Quality Gate Decision

The quality gate produces an accept/reject decision.

```text
                 Fundus Image
                      │
                      ▼
               Quality Analysis
                      │
          ┌───────────┴───────────┐
          │                       │
       ACCEPT                   REJECT
          │                       │
          ▼                       ▼
     Continue                 Stop / Feedback
          │                       │
          │                       ▼
          │                 Recapture Image
          │
          ▼
    Enhancement
```

A rejected image can produce feedback such as:

```text
BLURRY IMAGE

Action:
Refocus and recapture the retinal image.
```

This demonstrates the concept of **quality-aware screening**.

---

# 7. Step 3 — Image Enhancement

Images that pass the quality gate proceed to the enhancement stage.

The purpose of enhancement is to improve retinal image visibility before subsequent processing and visualization.

The prototype incorporates concepts including:

* Contrast enhancement
* CLAHE
* Illumination normalization

The workflow is:

```text
Quality Accepted
       │
       ▼
Image Enhancement
       │
       ▼
Enhanced Fundus Image
```

An example output is:

```text
results/enhanced_fundus.png
```

---

# 8. Step 4 — DR Screening

The screening stage is implemented in:

```text
src/dr_classifier.m
```

The current prototype represents diabetic retinopathy severity using an **ICDR-style Grade 0–4 representation**.

```text
Grade 0 → No apparent DR
Grade 1 → Mild NPDR
Grade 2 → Moderate NPDR
Grade 3 → Severe NPDR
Grade 4 → Proliferative DR
```

The classification component is part of the academic prototype.

It should not be interpreted as a clinically validated diagnostic model.

---

# 9. Demonstration Output

A previously generated prototype demonstration produced:

```text
DR Grade: 2
Classification: Moderate Non-Proliferative DR
Confidence: 87%
```

These values are **demonstration-level outputs**.

The 87% value must not be interpreted as:

* Model accuracy
* Dataset accuracy
* Clinical confidence
* Sensitivity
* Specificity
* Validated diagnostic performance

No such performance claim is made by the current prototype.

---

# 10. Step 5 — Explainability

The explainability stage is implemented in:

```text
src/explainability.m
```

The purpose of this stage is to provide visual evidence associated with the screening workflow.

The current prototype generates evidence visualizations based on image characteristics.

---

# 11. Current Evidence Maps

The prototype currently uses several evidence representations.

## Bright-Region Evidence

Highlights regions with higher image intensity.

## Dark-Region Evidence

Highlights darker regions of the retinal image.

## Local-Variation Evidence

Highlights regions containing local intensity variation.

These representations are intended to help visualize areas of the image that contributed to the prototype's evidence analysis.

---

# 12. Lesion Reference Visualization

The repository also contains:

```text
src/create_lesion_reference.m
```

This module supports generation of a lesion/evidence reference visualization.

The resulting output can be stored as:

```text
results/lesion_reference.png
```

The visualization is intended for demonstration and should not be interpreted as clinically validated lesion segmentation.

---

# 13. Explainability Workflow

The current explainability concept can be represented as:

```text
              Enhanced Fundus Image
                       │
                       ▼
               Evidence Analysis
                       │
          ┌────────────┼────────────┐
          │            │            │
          ▼            ▼            ▼
     Bright Areas   Dark Areas   Local Variation
          │            │            │
          └────────────┼────────────┘
                       │
                       ▼
               Evidence Map
```

The output can be visualized alongside the screening result.

---

# 14. Future Explainability

A future version can incorporate trained-model explainability techniques such as **Grad-CAM**.

The intended future workflow is:

```text
Trained DR Model
       │
       ▼
Model Prediction
       │
       ▼
Grad-CAM / Model Explanation
       │
       ▼
Important Retinal Regions
       │
       ▼
Human-Interpretable Evidence
```

Grad-CAM is a **future development direction** and is not claimed as an implemented trained-model component in the current prototype.

---

# 15. Step 6 — Automated Report

Report generation is handled by:

```text
src/generate_report.m
```

The report combines the relevant outputs from the screening workflow.

Typical fields include:

```text
Demo / Patient ID
Image Quality
DR Grade
Classification
Confidence
Evidence
Recommendation
Timestamp
```

The resulting report can be stored as:

```text
results/DRISHTI_Report.txt
```

---

# 16. Complete MATLAB Workflow

The MATLAB workflow can therefore be summarized as:

```text
                  START
                    │
                    ▼
            Select Fundus Image
                    │
                    ▼
             Load Image
                    │
                    ▼
             Quality Gate
                    │
          ┌─────────┴─────────┐
          │                   │
       REJECT                ACCEPT
          │                   │
          ▼                   ▼
   Recapture Feedback     Enhancement
                              │
                              ▼
                       DR Classification
                              │
                              ▼
                       Evidence Maps
                              │
                              ▼
                       Report Generation
                              │
                              ▼
                             END
```

---

# 17. MATLAB Source Modules

The workflow is divided into multiple source files.

| File                        | Workflow Role               |
| --------------------------- | --------------------------- |
| `DRISHTI_App.mlapp`         | Graphical user interface    |
| `main.m`                    | Main execution workflow     |
| `run_demo.m`                | End-to-end demonstration    |
| `quality_gate.m`            | Image quality assessment    |
| `dr_classifier.m`           | Prototype DR classification |
| `explainability.m`          | Evidence generation         |
| `generate_report.m`         | Automated report            |
| `create_lesion_reference.m` | Lesion/evidence reference   |
| `create_blurry_test.m`      | Blurry-image quality test   |

---

# 18. MATLAB App Workflow

The graphical interface is implemented using:

```text
DRISHTI_App.mlapp
```

The intended user workflow is:

```text
┌──────────────────────────┐
│ Select Fundus Image      │
└────────────┬─────────────┘
             │
             ▼
┌──────────────────────────┐
│ Run DRISHTI Screening    │
└────────────┬─────────────┘
             │
             ▼
┌──────────────────────────┐
│ Quality Assessment       │
└────────────┬─────────────┘
             │
             ▼
┌──────────────────────────┐
│ Screening Result         │
└────────────┬─────────────┘
             │
             ▼
┌──────────────────────────┐
│ Explainability Evidence  │
└────────────┬─────────────┘
             │
             ▼
┌──────────────────────────┐
│ Screening Report         │
└──────────────────────────┘
```

The interface is designed to provide a simple user-facing representation of the underlying MATLAB modules.

---

# 19. Blurry Image Test

The repository contains:

```text
src/create_blurry_test.m
```

This is used to demonstrate the quality-gate behaviour with a deliberately degraded image.

The conceptual test is:

```text
Good Fundus Image
        │
        ▼
Create Blurry Version
        │
        ▼
Quality Gate
        │
        ▼
REJECT
        │
        ▼
Recapture Feedback
```

This demonstrates that image-quality checking is an explicit stage rather than an assumption.

---

# 20. Prototype Results

The current workflow can generate files including:

```text
results/
│
├── enhanced_fundus.png
├── explainability_map.png
├── lesion_reference.png
└── DRISHTI_Report.txt
```

These files provide visual and textual evidence of the prototype workflow.

---

# 21. Step 7 — Rural Telemedicine Capacity Simulation

The second major part of the project is implemented using Simulink.

File:

```text
src/rural_capacity_model.slx
```

The simulation represents a simplified rural screening and review workflow.

---

# 22. Simulation Inputs

The model considers concepts such as:

### Incoming Demand

The number or level of screening cases entering the workflow.

### AI Screening

The automated screening stage.

### Human Review Capacity

The amount of work that can be reviewed by human specialists.

### Review Workload

Cases remaining after automated processing and requiring further review.

---

# 23. Simulation Outputs

The model can represent outputs such as:

* Remaining review
* Backlog
* Peak review
* Peak incoming demand
* Review capacity

A simplified representation is:

```text
Incoming Demand
       │
       ▼
   AI Screening
       │
       ▼
Cases for Human Review
       │
       ▼
Human Review Capacity
       │
       ├──────────────► Reviewed Cases
       │
       ▼
Remaining Work
       │
       ▼
Backlog
```

---

# 24. Why Simulink Is Included

The MATLAB pipeline operates mainly at the **image-processing level**.

The Simulink model operates at the **workflow/system level**.

Together they demonstrate two different aspects of the project:

```text
MATLAB
  │
  ├── Fundus image
  ├── Quality
  ├── Enhancement
  ├── Screening
  ├── Explainability
  └── Reporting

          +

SIMULINK
  │
  ├── Incoming demand
  ├── AI screening
  ├── Human review
  ├── Capacity
  └── Backlog
```

---

# 25. End-to-End DRISHTI Concept

Combining both parts:

```text
                         FUNDUS IMAGE
                              │
                              ▼
                       IMAGE QUALITY
                              │
                         ┌────┴────┐
                         │         │
                      Reject     Accept
                         │         │
                         ▼         ▼
                     Recapture  Enhancement
                                   │
                                   ▼
                             DR SCREENING
                                   │
                                   ▼
                            EXPLAINABILITY
                                   │
                                   ▼
                              REPORT
                                   │
                                   ▼
                         AI-ASSISTED WORKFLOW
                                   │
                                   ▼
                       ┌─────────────────────┐
                       │      SIMULINK       │
                       │                     │
                       │ Incoming Demand     │
                       │ Review Capacity     │
                       │ Remaining Work      │
                       │ Backlog             │
                       └─────────────────────┘
```

---

# 26. Current Workflow Status

| Workflow Stage                      | Status        |
| ----------------------------------- | ------------- |
| Fundus image input                  | Implemented   |
| Image quality gate                  | Implemented   |
| Focus / blur assessment             | Implemented   |
| Brightness assessment               | Implemented   |
| Dark-region analysis                | Implemented   |
| Image enhancement                   | Implemented   |
| Prototype DR classification         | Implemented   |
| ICDR-style Grade 0–4 representation | Implemented   |
| Evidence visualization              | Implemented   |
| Automated report                    | Implemented   |
| MATLAB application                  | Implemented   |
| Rural capacity simulation           | Implemented   |
| Grad-CAM                            | Planned       |
| Advanced lesion detection           | Planned       |
| Clinical validation                 | Not performed |
| IoT integration                     | Not included  |

---

# 27. Current Dataset

The workflow currently operates with:

```text
APTOS 2019
     │
     ▼
100 PNG retinal images
```

The following datasets are **selected/planned for future evaluation**:

```text
DRIVE
IDRiD
MESSIDOR-2
```

They are not currently used in the implemented 100-image prototype.

---

# 28. Important Prototype Limitations

The current workflow has several limitations:

1. The current dataset contains only 100 APTOS images.
2. The prototype is not clinically validated.
3. The classification output is demonstration-level.
4. The confidence value is not a validated clinical probability.
5. Current evidence maps are not clinically validated lesion localization.
6. The Simulink capacity model is simplified.
7. Planned datasets have not yet been incorporated into the current prototype.
8. IoT is not part of the current implementation.

---

# 29. Responsible Interpretation

The DRISHTI workflow should be interpreted as an academic prototype demonstrating:

```text
Quality-Aware Screening
        +
Explainability
        +
Automated Reporting
        +
Healthcare Workflow Simulation
```

It should not be interpreted as a clinically deployable diagnostic system.

Any real-world deployment would require appropriate:

* Model training
* Dataset validation
* Clinical evaluation
* External validation
* Privacy protection
* Security controls
* Regulatory assessment
* Medical oversight

---

# 30. Summary

The current DRISHTI prototype connects an image-level screening workflow with a rural healthcare capacity simulation.

```text
                DRISHTI
                   │
       ┌───────────┴───────────┐
       │                       │
       ▼                       ▼
     MATLAB                 Simulink
       │                       │
       ▼                       ▼
 Image Quality          Incoming Demand
       │                 AI Screening
 Enhancement             Human Review
       │                 Capacity
 DR Screening             Backlog
       │
 Explainability
       │
 Reporting
```

The result is a modular academic prototype demonstrating how explainable AI-assisted retinal screening can be combined with workflow-level capacity modelling.

---

## Related Documentation

* [`Project Overview`](PROJECT_OVERVIEW.md)
* [`System Architecture`](SYSTEM_ARCHITECTURE.md)
* [`Datasets`](DATASETS.md)
* [`MATLAB & Simulink`](MATLAB_SIMULINK.md)
* [`Results`](RESULTS.md)
* [`Future Scope`](FUTURE_SCOPE.md)
* [`Disclaimer`](DISCLAIMER.md)
