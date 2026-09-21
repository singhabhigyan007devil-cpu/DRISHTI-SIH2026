# DRISHTI — Datasets

## 1. Dataset Overview

DRISHTI uses retinal fundus image datasets to develop and demonstrate its diabetic retinopathy screening workflow.

The dataset strategy is divided into two categories:

```text
                 DRISHTI Dataset Strategy
                           │
              ┌────────────┴────────────┐
              │                         │
              ▼                         ▼
       CURRENT PROTOTYPE         PLANNED / SELECTED
              │                         │
              ▼                         ▼
        APTOS 2019                DRIVE
        100 images                 IDRiD
        PNG subset               MESSIDOR-2
```

The distinction between these categories is important.

**APTOS 2019 is currently used in the implemented prototype.**

**DRIVE, IDRiD, and MESSIDOR-2 are selected/planned datasets for broader future evaluation and are not currently used in the implemented 100-image prototype.**

---

# 2. Current Prototype Dataset

## APTOS 2019

The current DRISHTI prototype uses a subset of the **APTOS 2019** retinal fundus image dataset.

### Current usage

| Property            | Current Prototype                       |
| ------------------- | --------------------------------------- |
| Dataset             | APTOS 2019                              |
| Usage               | Currently used                          |
| Number of images    | **100**                                 |
| Image format        | PNG                                     |
| Purpose             | Prototype development and demonstration |
| Clinical validation | Not performed                           |

The current repository contains exactly **100 PNG retinal images** used for the prototype.

---

## 3. APTOS 2019 in the DRISHTI Workflow

The current prototype dataset follows this workflow:

```text
              APTOS 2019
                   │
                   ▼
          100-image subset
                   │
                   ▼
           PNG fundus images
                   │
                   ▼
          Image Quality Gate
                   │
                   ▼
           Image Enhancement
                   │
                   ▼
           DR Screening
                   │
                   ▼
           Explainability
                   │
                   ▼
          Automated Report
```

The images are used to demonstrate the end-to-end prototype workflow.

---

# 4. Why APTOS 2019 Is Used in the Current Prototype

APTOS 2019 provides retinal fundus images associated with diabetic retinopathy grading and is suitable for developing a prototype screening workflow.

For the current SIH prototype, a limited subset of 100 images is used so that the complete workflow can be developed and demonstrated efficiently.

The current implementation focuses on demonstrating the **system workflow and integration of MATLAB components**, rather than claiming clinical performance.

---

# 5. Current Dataset Scope

The current implementation should be understood as:

```text
APTOS 2019
    │
    └── Selected prototype subset
             │
             └── 100 PNG images
```

The 100 images are **not intended to represent the complete APTOS 2019 dataset**.

They are a limited subset used for prototype development and demonstration.

---

# 6. Planned / Selected Datasets

For broader future evaluation, DRISHTI has selected/planned three additional retinal datasets:

1. DRIVE
2. IDRiD
3. MESSIDOR-2

These datasets are intended to support future development and evaluation of different parts of the DRISHTI workflow.

> **Important:** DRIVE, IDRiD, and MESSIDOR-2 are not currently used in the implemented 100-image prototype.

---

# 7. DRIVE

## Dataset Role

**DRIVE** is selected/planned as a future dataset for retinal image analysis and vessel-related evaluation.

Potential future applications within DRISHTI include:

* Retinal vessel analysis
* Vessel segmentation research
* Evaluation of image-processing components
* Supporting future explainability/retinal-structure analysis

### Current Status

```text
DRIVE
   │
   ▼
Selected / Planned
   │
   ▼
Not currently used
in the 100-image prototype
```

---

# 8. IDRiD

## Dataset Role

**IDRiD (Indian Diabetic Retinopathy Image Dataset)** is selected/planned for future evaluation involving diabetic retinopathy and retinal lesion analysis.

Potential future applications include:

* DR severity evaluation
* Lesion-level analysis
* Diabetic retinopathy research
* Future explainability development
* Evaluation of lesion-related processing

### Current Status

```text
IDRiD
   │
   ▼
Selected / Planned
   │
   ▼
Not currently used
in the 100-image prototype
```

---

# 9. MESSIDOR-2

## Dataset Role

**MESSIDOR-2** is selected/planned as an additional dataset for broader future evaluation of diabetic retinopathy screening workflows.

Potential future applications include:

* Cross-dataset evaluation
* DR screening research
* Generalization studies
* Comparison of screening performance across datasets

### Current Status

```text
MESSIDOR-2
      │
      ▼
Selected / Planned
      │
      ▼
Not currently used
in the 100-image prototype
```

---

# 10. Dataset Categories

The dataset strategy can be summarized as follows:

| Dataset        | Category           | Current Prototype Usage    | Planned Purpose                         |
| -------------- | ------------------ | -------------------------- | --------------------------------------- |
| **APTOS 2019** | Current            | **Yes — 100-image subset** | Prototype development and demonstration |
| **DRIVE**      | Selected / Planned | No                         | Retinal vessel / structural evaluation  |
| **IDRiD**      | Selected / Planned | No                         | DR and lesion-related evaluation        |
| **MESSIDOR-2** | Selected / Planned | No                         | Broader/cross-dataset DR evaluation     |

---

# 11. Important Dataset Accuracy Statement

The following distinction must be maintained throughout the DRISHTI documentation and presentation:

### Currently Used

**APTOS 2019 — 100 PNG retinal images**

### Selected / Planned

**DRIVE — future evaluation**

**IDRiD — future evaluation**

**MESSIDOR-2 — future evaluation**

Therefore, it would be incorrect to state that the current prototype has been evaluated on all four datasets.

---

# 12. Dataset Usage and Prototype Workflow

The current 100-image APTOS subset is used within the prototype as follows:

```text
                 100 APTOS Images
                         │
                         ▼
                ┌────────────────┐
                │ Image Loading  │
                └───────┬────────┘
                        │
                        ▼
                ┌────────────────┐
                │ Quality Gate   │
                └───────┬────────┘
                        │
                ┌───────┴───────┐
                │               │
             Reject           Accept
                │               │
                ▼               ▼
          Recapture        Enhancement
          Feedback              │
                                ▼
                         DR Classification
                                │
                                ▼
                         Explainability
                                │
                                ▼
                         Report Generation
```

---

# 13. Data Processing Considerations

The dataset is processed as retinal fundus imagery.

The current prototype workflow can perform operations including:

* Image loading
* Quality assessment
* Enhancement
* Evidence visualization
* Prototype screening
* Report generation

The processing pipeline is designed to operate on individual retinal images.

---

# 14. Image Quality

Image quality is particularly important in retinal screening workflows.

The current DRISHTI prototype therefore evaluates image characteristics before continuing with screening.

The quality gate considers:

* Focus / blur
* Brightness
* Dark-region characteristics

The conceptual workflow is:

```text
Fundus Image
     │
     ▼
Quality Assessment
     │
 ┌───┴────┐
 │        │
Pass     Fail
 │        │
 ▼        ▼
Screen   Recapture
```

This approach is intended to reduce the possibility of continuing the workflow with unsuitable images.

---

# 15. Dataset and Explainability

The current prototype generates evidence visualizations from the retinal image.

These include:

* Bright-region evidence
* Dark-region evidence
* Local-variation evidence
* Lesion/evidence reference visualization

These visualizations are intended to demonstrate the **explainability concept**.

They should not be interpreted as clinically validated lesion segmentation or definitive disease localization.

---

# 16. Dataset Expansion Strategy

Future dataset expansion can follow a staged approach.

### Stage 1 — Current Prototype

```text
APTOS 2019
     │
     ▼
100-image subset
     │
     ▼
Prototype development
```

### Stage 2 — Broader Dataset Evaluation

```text
APTOS 2019
     +
DRIVE
     +
IDRiD
     +
MESSIDOR-2
     │
     ▼
Broader evaluation
```

### Stage 3 — Cross-Dataset Validation

Future research could investigate whether models and processing workflows generalize across datasets with different image characteristics and acquisition conditions.

This stage has **not yet been completed**.

---

# 17. Dataset Limitations

The current dataset setup has several limitations.

### Limited Number of Images

Only 100 images are currently included in the prototype.

### Single Current Dataset

The implemented prototype currently uses an APTOS 2019 subset.

### No Cross-Dataset Evaluation

The current prototype has not been evaluated across DRIVE, IDRiD, and MESSIDOR-2.

### No Clinical Validation

The current dataset usage does not establish clinical diagnostic performance.

### Dataset Distribution

A limited subset cannot represent the complete diversity of retinal images encountered in real-world screening environments.

---

# 18. Clinical Validation

The current dataset configuration must not be interpreted as clinical validation.

A clinically meaningful evaluation would require substantially broader testing and appropriate validation methodology, potentially including:

* Larger datasets
* Independent test sets
* Multi-dataset evaluation
* Appropriate performance metrics
* Expert/clinical reference standards
* External validation
* Prospective evaluation where appropriate

These activities are outside the scope of the current prototype.

---

# 19. Data Privacy and Responsible Use

Any future clinical or real-world deployment would need appropriate consideration of:

* Patient privacy
* Data protection
* Secure storage
* Access control
* Data governance
* Ethical approval where applicable
* Appropriate clinical validation

The current prototype is an academic demonstration and is not intended for handling clinical patient records.

---

# 20. Dataset Status Summary

```text
┌───────────────────────────────────────────┐
│             CURRENT PROTOTYPE             │
│                                           │
│ APTOS 2019                                │
│ 100 PNG retinal images                    │
│ Currently used                            │
└─────────────────────┬─────────────────────┘
                      │
                      ▼
              DRISHTI Prototype
                      │
          ┌───────────┼───────────┐
          │           │           │
          ▼           ▼           ▼
       Quality    Screening   Explainability
          │           │           │
          └───────────┼───────────┘
                      │
                      ▼
                  Reporting


┌───────────────────────────────────────────┐
│          SELECTED / PLANNED              │
│                                           │
│ DRIVE                                     │
│ IDRiD                                     │
│ MESSIDOR-2                                │
│                                           │
│ Future broader evaluation                 │
└───────────────────────────────────────────┘
```

---

# 21. Summary

The DRISHTI dataset strategy deliberately separates **current implementation** from **future validation**.

### Current Prototype

**APTOS 2019 — 100 PNG retinal images**

### Selected / Planned

* **DRIVE**
* **IDRiD**
* **MESSIDOR-2**

The current prototype is intended to demonstrate the feasibility and integration of the DRISHTI workflow in MATLAB and Simulink.

It does not claim clinical accuracy, clinical validation, or generalization across the planned datasets.

---

## 22. Related Documentation

* [`Project Overview`](PROJECT_OVERVIEW.md)
* [`System Architecture`](SYSTEM_ARCHITECTURE.md)
* [`Prototype Workflow`](PROTOTYPE_WORKFLOW.md)
* [`MATLAB & Simulink`](MATLAB_SIMULINK.md)
* [`Results`](RESULTS.md)
* [`Future Scope`](FUTURE_SCOPE.md)
* [`Disclaimer`](DISCLAIMER.md)

Dataset files and additional information are available in:

[`data/README.md`](../data/README.md)
