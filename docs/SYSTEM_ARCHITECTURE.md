# DRISHTI — System Architecture

## 1. Overview

DRISHTI is a modular prototype for **Explainable AI-based Diabetic Retinopathy Screening in Rural India**.

The architecture combines:

* Retinal fundus image processing
* Image quality assessment
* Image enhancement
* DR severity screening
* Explainability and evidence visualization
* Automated reporting
* Rural telemedicine capacity simulation

The current prototype is implemented using **MATLAB and Simulink**.

---

## 2. High-Level Architecture

The complete DRISHTI prototype can be represented as:

```text
                         ┌───────────────────────┐
                         │   FUNDUS IMAGE INPUT  │
                         └───────────┬───────────┘
                                     │
                                     ▼
                         ┌───────────────────────┐
                         │   IMAGE QUALITY GATE  │
                         │                       │
                         │ • Focus / Blur        │
                         │ • Brightness          │
                         │ • Dark-region analysis│
                         └───────────┬───────────┘
                                     │
                       ┌─────────────┴─────────────┐
                       │                           │
                    REJECT                       ACCEPT
                       │                           │
                       ▼                           ▼
              ┌────────────────┐       ┌────────────────────┐
              │ Recapture      │       │ Image Enhancement  │
              │ Feedback       │       │                    │
              └────────────────┘       │ • CLAHE concepts  │
                                       │ • Illumination     │
                                       │   normalization    │
                                       └──────────┬─────────┘
                                                  │
                                                  ▼
                                       ┌────────────────────┐
                                       │    DR SCREENING    │
                                       │                    │
                                       │ ICDR-style Grade   │
                                       │       0 – 4        │
                                       └──────────┬─────────┘
                                                  │
                                                  ▼
                                       ┌────────────────────┐
                                       │   EXPLAINABILITY   │
                                       │                    │
                                       │ • Bright evidence │
                                       │ • Dark evidence   │
                                       │ • Local variation │
                                       │ • Lesion reference│
                                       └──────────┬─────────┘
                                                  │
                                                  ▼
                                       ┌────────────────────┐
                                       │ AUTOMATED REPORT   │
                                       │                    │
                                       │ • Quality          │
                                       │ • Grade            │
                                       │ • Classification   │
                                       │ • Confidence       │
                                       │ • Evidence         │
                                       │ • Recommendation   │
                                       │ • Timestamp        │
                                       └──────────┬─────────┘
                                                  │
                                                  ▼
                                       ┌────────────────────┐
                                       │ RURAL TELEMEDICINE │
                                       │ CAPACITY SIMULATION│
                                       │                    │
                                       │ • Incoming demand  │
                                       │ • AI screening     │
                                       │ • Human review     │
                                       │ • Backlog          │
                                       └────────────────────┘
```

---

## 3. Architectural Layers

The system can be divided into five major layers:

```text
┌───────────────────────────────────────────────┐
│                USER INTERFACE                 │
│             MATLAB App Designer              │
├───────────────────────────────────────────────┤
│              SCREENING PIPELINE               │
│ Quality → Enhancement → Classification       │
├───────────────────────────────────────────────┤
│             EXPLAINABILITY LAYER              │
│ Evidence Maps / Visualization / References   │
├───────────────────────────────────────────────┤
│              REPORTING LAYER                  │
│ Automated Screening Report Generation         │
├───────────────────────────────────────────────┤
│             SIMULATION LAYER                  │
│        MATLAB + Simulink Capacity Model      │
└───────────────────────────────────────────────┘
```

---

# 4. Layer 1 — User Interface

## MATLAB App Designer

The primary graphical interface is implemented using:

```text
DRISHTI_App.mlapp
```

The application provides an interface through which a user can:

1. Select a retinal fundus image.
2. View the selected image.
3. Run the DRISHTI screening workflow.
4. View screening information.
5. View explainability/evidence output.
6. View status information.
7. Access the rural capacity simulation where implemented.

The interface is intended to provide a simple workflow rather than requiring the user to execute individual MATLAB functions manually.

---

# 5. Layer 2 — Image Input

The first stage of the processing pipeline is the retinal fundus image.

The current prototype uses:

```text
APTOS 2019
      │
      ▼
100-image prototype subset
      │
      ▼
PNG retinal fundus images
```

The image is supplied to the MATLAB processing pipeline for quality assessment.

---

# 6. Layer 3 — Image Quality Gate

The quality gate is implemented in:

```text
quality_gate.m
```

Its purpose is to identify images that may not be suitable for the subsequent screening workflow.

The current prototype considers:

### Focus / Blur

An image-quality indicator is used to identify whether the image has sufficient visual sharpness.

### Brightness

The overall illumination level is evaluated.

### Dark-Region Analysis

The proportion or characteristics of dark regions are considered as part of the prototype quality assessment.

---

## Quality Decision

The quality gate produces a prototype-level decision:

```text
                    Fundus Image
                         │
                         ▼
                ┌────────────────┐
                │ Quality Checks │
                └───────┬────────┘
                        │
              ┌─────────┴─────────┐
              │                   │
           ACCEPT               REJECT
              │                   │
              ▼                   ▼
        Continue Pipeline     Recapture Image
```

A rejected image is not intended to proceed through the normal screening workflow.

Instead, the system can provide feedback such as:

```text
BLURRY IMAGE
Refocus and recapture the retinal image.
```

---

# 7. Layer 4 — Image Enhancement

After passing the quality gate, the image proceeds to enhancement.

The enhancement stage is intended to improve the visibility of retinal structures.

Concepts used in the prototype include:

* Contrast enhancement
* CLAHE
* Illumination normalization

The general workflow is:

```text
Original Fundus Image
          │
          ▼
Quality Accepted
          │
          ▼
Enhancement
          │
          ▼
Enhanced Fundus Image
```

The enhanced image can subsequently be used for screening and evidence visualization.

---

# 8. Layer 5 — DR Screening

The screening stage is implemented in:

```text
dr_classifier.m
```

The prototype represents diabetic retinopathy severity using an **ICDR-style Grade 0–4 scale**.

```text
Grade 0 → No apparent DR
Grade 1 → Mild NPDR
Grade 2 → Moderate NPDR
Grade 3 → Severe NPDR
Grade 4 → Proliferative DR
```

The current implementation is a prototype/demo-level screening component.

It should not be interpreted as a clinically validated diagnostic model.

---

## Example Prototype Output

A previously generated demonstration output was:

```text
Grade: 2
Classification: Moderate Non-Proliferative DR
Confidence: 87%
```

The above values are demonstration outputs from the prototype.

They do **not** represent:

* Clinical accuracy
* Validated model performance
* Dataset-wide performance
* Diagnostic confidence
* Medical certification

---

# 9. Layer 6 — Explainability

The explainability component is implemented in:

```text
explainability.m
```

The objective is to provide visual evidence associated with the screening workflow.

The current prototype generates evidence using image characteristics.

---

## Current Evidence Types

### Bright-Region Evidence

Highlights areas with higher intensity that may be useful for visual inspection.

### Dark-Region Evidence

Highlights darker areas within the retinal image.

### Local-Variation Evidence

Highlights regions with local intensity variation.

### Lesion Reference

The prototype also contains:

```text
create_lesion_reference.m
```

which is used to generate a lesion/evidence reference visualization.

---

## Explainability Flow

```text
                   Screening Result
                          │
                          ▼
                  Evidence Analysis
                          │
          ┌───────────────┼───────────────┐
          │               │               │
          ▼               ▼               ▼
    Bright Regions   Dark Regions   Local Variation
          │               │               │
          └───────────────┼───────────────┘
                          │
                          ▼
                 Evidence Visualization
```

---

# 10. Future Model-Based Explainability

More advanced explainability techniques are planned for future development.

One potential approach is:

```text
Trained DR Model
       │
       ▼
Grad-CAM / Model Explanation
       │
       ▼
Important Image Regions
       │
       ▼
Human-Interpretable Explanation
```

This is a **future direction** and should not be represented as an already implemented Grad-CAM model in the current prototype.

---

# 11. Layer 7 — Automated Reporting

Report generation is handled by:

```text
generate_report.m
```

The report consolidates the screening information into a structured output.

A report can contain:

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

The reporting flow is:

```text
Quality Result
      +
DR Screening Result
      +
Evidence
      +
Recommendation
      │
      ▼
Automated Report
```

An example report is stored in the `results/` directory.

---

# 12. Layer 8 — Rural Telemedicine Capacity Simulation

The rural workflow simulation is implemented using:

```text
rural_capacity_model.slx
```

The model is developed in Simulink.

Its purpose is to demonstrate how AI-assisted screening can be considered alongside limited human review capacity.

---

## Main Simulation Concepts

### Incoming Demand

Represents the number or level of screening cases entering the workflow.

### AI Screening

Represents the automated screening stage that processes incoming cases before human review.

### Human Review

Represents specialist/clinical review capacity.

### Remaining Review

Represents cases that still require human review.

### Backlog

Represents accumulated work when incoming review demand exceeds available review capacity.

---

## Simplified Simulation Flow

```text
             Incoming Demand
                    │
                    ▼
              AI Screening
                    │
                    ▼
          Cases Requiring Review
                    │
                    ▼
             Human Review
                    │
             ┌──────┴──────┐
             │             │
          Capacity      Excess Demand
             │             │
             ▼             ▼
       Cases Reviewed    Backlog
```

---

# 13. Relationship Between MATLAB and Simulink

MATLAB and Simulink serve different but complementary purposes.

```text
                  DRISHTI
                     │
          ┌──────────┴──────────┐
          │                     │
          ▼                     ▼
       MATLAB                Simulink
          │                     │
          │                     │
 Image Processing        Workflow Simulation
          │                     │
 Quality Assessment      Incoming Demand
          │               Human Review
 Enhancement             Capacity
          │               Backlog
 DR Screening
          │
 Explainability
          │
 Report Generation
```

MATLAB primarily handles the **image-level screening workflow**, while Simulink represents the **system-level capacity/workflow behaviour**.

---

# 14. End-to-End Architecture

The complete conceptual architecture is:

```text
┌──────────────────┐
│ Fundus Image     │
└────────┬─────────┘
         │
         ▼
┌──────────────────┐
│ Quality Gate     │
│ Focus            │
│ Brightness       │
│ Dark Regions     │
└────────┬─────────┘
         │
     ┌───┴────┐
     │        │
   Reject   Accept
     │        │
     ▼        ▼
 Recapture  Enhancement
 Feedback      │
               ▼
       ┌───────────────┐
       │ DR Screening  │
       │ Grade 0–4    │
       └───────┬───────┘
               │
               ▼
       ┌───────────────┐
       │ Explainability│
       │ Evidence Maps │
       └───────┬───────┘
               │
               ▼
       ┌───────────────┐
       │ Automated     │
       │ Report        │
       └───────┬───────┘
               │
               ▼
       ┌───────────────┐
       │ Simulink      │
       │ Rural Capacity│
       │ Simulation    │
       └───────────────┘
```

---

# 15. Source-Level Architecture

The MATLAB source files are organized according to their responsibilities.

```text
src/
│
├── DRISHTI_App.mlapp
│       │
│       └── User Interface
│
├── main.m
│       │
│       └── Main Workflow
│
├── run_demo.m
│       │
│       └── Demonstration Workflow
│
├── quality_gate.m
│       │
│       └── Image Quality Assessment
│
├── dr_classifier.m
│       │
│       └── Prototype DR Classification
│
├── explainability.m
│       │
│       └── Evidence Visualization
│
├── generate_report.m
│       │
│       └── Report Generation
│
├── create_lesion_reference.m
│       │
│       └── Lesion/Evidence Reference
│
├── create_blurry_test.m
│       │
│       └── Quality-Gate Test Image
│
└── rural_capacity_model.slx
        │
        └── Simulink Capacity Model
```

---

# 16. Data Flow

The primary data flow is:

```text
APTOS Image
    │
    ▼
Image Loading
    │
    ▼
Quality Assessment
    │
    ├──────────────► Quality Feedback
    │
    ▼
Image Enhancement
    │
    ▼
DR Screening
    │
    ├──────────────► Grade + Classification
    │
    ▼
Evidence Generation
    │
    ▼
Report Generation
    │
    ▼
Prototype Results
```

---

# 17. Output Files

The prototype can generate output artifacts such as:

| Output                   | Purpose                               |
| ------------------------ | ------------------------------------- |
| `enhanced_fundus.png`    | Enhanced retinal image                |
| `explainability_map.png` | Evidence/explainability visualization |
| `lesion_reference.png`   | Lesion/evidence reference image       |
| `DRISHTI_Report.txt`     | Automated screening report            |

These outputs are stored in the `results/` directory.

---

# 18. Design Principles

The current DRISHTI architecture follows several design principles.

### Modularity

Each major function is separated into an independent MATLAB module.

### Quality First

Image quality is checked before the screening workflow continues.

### Explainability

The system attempts to provide visual evidence alongside screening results.

### Human Review

The system is designed as a screening-support concept rather than a replacement for qualified healthcare professionals.

### Workflow Awareness

The Simulink component considers workload and review capacity in addition to image-level processing.

### Extensibility

The modular architecture allows future models, datasets, and explainability methods to be incorporated.

---

# 19. Current vs Future Architecture

| Component           | Current Prototype       | Future Direction                                 |
| ------------------- | ----------------------- | ------------------------------------------------ |
| Image Input         | APTOS PNG images        | Larger multi-source datasets                     |
| Quality Gate        | Implemented             | More robust quality model                        |
| Enhancement         | Implemented             | Advanced preprocessing                           |
| DR Classification   | Prototype/demo          | Trained and validated model                      |
| Evidence            | Prototype evidence maps | Model-based Grad-CAM / lesion explanations       |
| Reporting           | Implemented             | More structured clinical workflow                |
| Capacity Simulation | Simulink prototype      | More realistic healthcare modelling              |
| Dataset             | 100-image APTOS subset  | DRIVE, IDRiD, MESSIDOR-2 + additional evaluation |
| Clinical Validation | Not performed           | Future requirement                               |

---

# 20. Architecture Limitations

The current architecture is a prototype and has several limitations:

* The current dataset contains only 100 APTOS images.
* The screening component is not clinically validated.
* Current evidence maps should not be interpreted as validated lesion localization.
* The Simulink model is a simplified capacity representation.
* Advanced model-based explainability is not yet implemented.
* DRIVE, IDRiD, and MESSIDOR-2 are planned datasets rather than current prototype datasets.
* IoT is not part of the current architecture.

---

## 21. Summary

DRISHTI combines an image-processing pipeline with a system-level simulation:

```text
                 DRISHTI
                    │
       ┌────────────┴────────────┐
       │                         │
       ▼                         ▼
     MATLAB                   Simulink
       │                         │
       ▼                         ▼
Quality Assessment        Incoming Demand
       │                  AI Screening
Enhancement               Human Review
       │                  Capacity
DR Screening              Backlog
       │
Explainability
       │
Reporting
       │
       ▼
Prototype Screening Workflow
```

The architecture is designed to demonstrate how **image quality, screening, explainability, reporting, and rural healthcare capacity considerations** can be brought together into one modular prototype.

---

## 22. Related Documentation

* [`Project Overview`](PROJECT_OVERVIEW.md)
* [`Datasets`](DATASETS.md)
* [`Prototype Workflow`](PROTOTYPE_WORKFLOW.md)
* [`MATLAB & Simulink`](MATLAB_SIMULINK.md)
* [`Results`](RESULTS.md)
* [`Future Scope`](FUTURE_SCOPE.md)
* [`Disclaimer`](DISCLAIMER.md)
