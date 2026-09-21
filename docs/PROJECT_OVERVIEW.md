# DRISHTI — Project Overview

## 1. Project Information

| Field                     | Details                                                          |
| ------------------------- | ---------------------------------------------------------------- |
| Project Name              | **DRISHTI**                                                      |
| Full Name                 | Explainable AI for Diabetic Retinopathy Screening in Rural India |
| Smart India Hackathon     | **SIH 2026**                                                     |
| Problem Statement         | **SIH26038**                                                     |
| Organization              | **MathWorks**                                                    |
| Theme                     | **Clean & Green Technology**                                     |
| Category                  | **Software**                                                     |
| Technology                | MATLAB + Simulink                                                |
| Current Prototype Dataset | APTOS 2019 subset                                                |
| Current Prototype Images  | 100 PNG retinal images                                           |
| Prototype Status          | Academic / demonstration prototype                               |

---

## 2. Project Background

Diabetic retinopathy (DR) is a diabetes-related retinal condition that can progressively affect vision.

Early screening can help identify people who may require further examination by qualified eye-care professionals. However, screening workflows in rural and resource-constrained environments can face challenges such as limited specialist availability, variable retinal image quality, and increasing screening workload.

DRISHTI explores how an explainable AI-assisted workflow could support retinal screening while also considering the practical requirements of rural healthcare workflows.

The project is developed in response to **SIH26038 — Explainable AI for Diabetic Retinopathy Screening in Rural India**.

---

## 3. Problem Statement

The project addresses the challenge of developing an explainable technology-assisted approach for diabetic retinopathy screening in rural India.

A useful screening workflow should not simply produce a disease classification. It should also consider:

* Whether the input retinal image is suitable for analysis
* How the retinal image can be enhanced for better visibility
* How DR severity can be represented
* What visual evidence contributes to the screening result
* How screening information can be communicated through a structured report
* How AI-assisted screening could interact with limited human review capacity

DRISHTI therefore combines these aspects into a modular prototype.

---

## 4. Proposed Approach

The DRISHTI workflow is organized into seven major stages:

```text
                    ┌──────────────────────┐
                    │   Fundus Image Input │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │   Image Quality Gate │
                    │ Focus / Brightness / │
                    │   Dark-Region Check  │
                    └──────────┬───────────┘
                               │
                    ┌──────────┴──────────┐
                    │                     │
                 Reject                 Accept
                    │                     │
                    ▼                     ▼
            Recapture Feedback    Image Enhancement
                                          │
                                          ▼
                               ┌──────────────────────┐
                               │    DR Screening      │
                               │   ICDR-style 0–4    │
                               └──────────┬───────────┘
                                          │
                                          ▼
                               ┌──────────────────────┐
                               │    Explainability    │
                               │  Evidence Maps /     │
                               │ Visualization        │
                               └──────────┬───────────┘
                                          │
                                          ▼
                               ┌──────────────────────┐
                               │ Automated Screening  │
                               │       Report         │
                               └──────────┬───────────┘
                                          │
                                          ▼
                               ┌──────────────────────┐
                               │ Rural Telemedicine   │
                               │ Capacity Simulation  │
                               └──────────────────────┘
```

---

## 5. Main Objectives

The current project has the following objectives:

### Objective 1 — Image Quality Assessment

Identify retinal images that may be unsuitable for further processing using prototype-level quality indicators.

The current quality gate considers:

* Focus / blur
* Brightness / illumination
* Dark-region characteristics

If an image fails the quality check, the system can provide feedback suggesting that the image be captured again.

---

### Objective 2 — Image Enhancement

Improve the visibility of retinal structures before screening.

The prototype incorporates image enhancement concepts including:

* Contrast enhancement
* CLAHE
* Illumination normalization

The purpose is to create a more suitable image for subsequent analysis and visualization.

---

### Objective 3 — DR Severity Screening

Provide a prototype-level representation of diabetic retinopathy severity using an **ICDR-style Grade 0–4 scale**.

The five grades represent:

| Grade | General Classification |
| ----: | ---------------------- |
|     0 | No apparent DR         |
|     1 | Mild NPDR              |
|     2 | Moderate NPDR          |
|     3 | Severe NPDR            |
|     4 | Proliferative DR       |

The current implementation is a **demonstration prototype** and does not establish clinically validated classification performance.

---

### Objective 4 — Explainability

Provide visual evidence associated with the screening workflow.

The current prototype can generate evidence visualizations based on image characteristics such as:

* Bright regions
* Dark regions
* Local intensity variation
* Lesion/evidence reference visualization

More advanced model-based methods such as Grad-CAM and lesion-level explanations are considered future development directions.

---

### Objective 5 — Automated Reporting

Generate a structured screening report containing relevant information such as:

* Demo / patient identifier
* Image quality
* DR grade
* Classification
* Confidence
* Evidence
* Recommendation
* Timestamp

This provides a consistent format for recording prototype screening results.

---

### Objective 6 — Rural Healthcare Workflow Simulation

Use Simulink to model a simplified rural telemedicine screening workflow.

The simulation considers:

* Incoming screening demand
* AI-assisted screening
* Human review capacity
* Remaining review workload
* Backlog
* Peak demand
* Peak review capacity

The simulation is intended to demonstrate the workflow-level implications of AI-assisted screening in a resource-constrained environment.

---

## 6. Current Prototype Dataset

The current prototype uses a subset of the **APTOS 2019 dataset**.

### Current Dataset Usage

```text
APTOS 2019
     │
     ▼
100-image prototype subset
     │
     ▼
PNG retinal fundus images
     │
     ▼
DRISHTI prototype workflow
```

Exactly **100 PNG retinal images** are currently included in the prototype.

The current dataset is intended for prototype demonstration and development.

It does **not** constitute sufficient evidence for clinical validation.

---

## 7. Planned Dataset Expansion

For broader future evaluation, the project has selected/planned the following datasets:

* DRIVE
* IDRiD
* MESSIDOR-2

These datasets are **planned/selected for future validation** and are **not currently part of the implemented 100-image prototype**.

Detailed dataset information is documented separately in:

[`docs/DATASETS.md`](DATASETS.md)

---

## 8. Technology Architecture

DRISHTI uses two primary MathWorks technologies:

### MATLAB

MATLAB handles the primary image-processing and screening workflow.

The MATLAB implementation includes modules for:

* Application interface
* Image loading
* Quality assessment
* Image enhancement
* DR classification
* Explainability
* Report generation

### Simulink

Simulink is used for the rural telemedicine capacity simulation.

The simulation models the interaction between:

```text
Incoming Demand
       │
       ▼
AI Screening
       │
       ▼
Human Review Queue
       │
       ▼
Review Capacity
       │
       ▼
Remaining Workload / Backlog
```

---

## 9. Modular Implementation

The prototype is divided into multiple source files.

| Module                      | Function                             |
| --------------------------- | ------------------------------------ |
| `DRISHTI_App.mlapp`         | MATLAB graphical user interface      |
| `main.m`                    | Main workflow                        |
| `run_demo.m`                | End-to-end demonstration             |
| `quality_gate.m`            | Image quality assessment             |
| `dr_classifier.m`           | Prototype DR classification          |
| `explainability.m`          | Evidence visualization               |
| `generate_report.m`         | Report generation                    |
| `create_lesion_reference.m` | Lesion/evidence reference generation |
| `create_blurry_test.m`      | Blurry image test generation         |
| `rural_capacity_model.slx`  | Simulink capacity model              |

This modular structure allows individual components to be improved independently.

---

## 10. Prototype Output

A typical DRISHTI workflow can produce:

```text
Input Fundus Image
        │
        ▼
Quality Decision
        │
        ▼
Enhanced Fundus Image
        │
        ▼
DR Screening Result
        │
        ▼
Evidence / Explainability Map
        │
        ▼
Automated Report
```

Example demonstration output previously generated by the prototype:

```text
DR Grade: 2
Classification: Moderate Non-Proliferative DR
Confidence: 87%
```

These values are **demonstration outputs from the current prototype** and must not be interpreted as trained-model accuracy, clinical confidence, or validated diagnostic performance.

---

## 11. Explainability Philosophy

A central design objective of DRISHTI is to avoid presenting screening as a completely opaque prediction.

Instead, the prototype attempts to provide visual evidence alongside the screening result.

The intended concept is:

```text
             Screening Result
                    │
                    ▼
             Why this result?
                    │
                    ▼
          Visual Evidence
                    │
        ┌───────────┼───────────┐
        ▼           ▼           ▼
   Bright Areas  Dark Areas  Local Variation
        │           │           │
        └───────────┼───────────┘
                    ▼
             Evidence View
```

Future development can replace or supplement these prototype evidence methods with trained-model explainability techniques.

---

## 12. Rural Healthcare Context

The rural component of DRISHTI considers a situation in which:

1. Retinal images are acquired at screening locations.
2. Image quality is checked.
3. Suitable images are processed through an AI-assisted screening workflow.
4. Cases requiring further review can enter a human review workflow.
5. Specialist capacity is limited.
6. Screening demand may exceed available review capacity.
7. The resulting workload can be studied using simulation.

The purpose of the Simulink model is therefore to explore **system capacity and workflow behaviour**, rather than to claim real-world healthcare performance.

---

## 13. Current Development Status

| Component                   | Current Status     |
| --------------------------- | ------------------ |
| Fundus image input          | Implemented        |
| Image quality gate          | Implemented        |
| Image enhancement           | Implemented        |
| Prototype DR classification | Implemented        |
| Evidence visualization      | Implemented        |
| Automated reporting         | Implemented        |
| MATLAB application          | Implemented        |
| Simulink capacity model     | Implemented        |
| APTOS 100-image subset      | Currently used     |
| DRIVE                       | Planned            |
| IDRiD                       | Planned            |
| MESSIDOR-2                  | Planned            |
| Grad-CAM                    | Future development |
| Advanced lesion detection   | Future development |
| Clinical validation         | Not performed      |
| IoT integration             | Not included       |

---

## 14. Current Limitations

The current prototype has important limitations:

### Limited Dataset

The current implementation uses only 100 images from the APTOS 2019 dataset.

### Demonstration-Level Classification

The current DR classification component is part of an academic prototype and does not establish clinical diagnostic accuracy.

### No Clinical Validation

The prototype has not undergone prospective clinical evaluation or validation by medical professionals.

### Prototype Explainability

Current evidence maps are intended to demonstrate the explainability concept. They should not be interpreted as clinically validated lesion localization.

### Simplified Capacity Model

The Simulink model represents a simplified workflow and does not model every variable present in a real healthcare system.

---

## 15. Future Direction

The project can be extended through:

* Larger multi-dataset evaluation
* Dedicated trained DR classification models
* Lesion-level detection
* Robust image-quality assessment
* Grad-CAM-based explanations
* Confidence calibration
* Cross-dataset validation
* Improved rural workload modelling
* Clinical evaluation
* Appropriate privacy and security mechanisms
* Integration into validated clinical workflows

These capabilities are considered future development and are not claimed as completed features.

---

## 16. Project Significance

DRISHTI brings together several components that are often considered separately:

```text
Image Quality
      +
Image Enhancement
      +
DR Screening
      +
Explainability
      +
Automated Reporting
      +
Capacity Simulation
      │
      ▼
Integrated Prototype Workflow
```

The project therefore demonstrates a broader concept of **AI-assisted screening workflow design**, rather than focusing only on disease classification.

---

## 17. Prototype Access

A MATLAB Online sharing link is available for the prototype:

**[VIEW DRISHTI PROTOTYPE](https://drive.mathworks.com/sharing/a3c07093-9e5e-4929-e9e3-8e3e8a12704a)**

Access to the shared MATLAB application requires appropriate MATLAB/MathWorks access.

---

## 18. Disclaimer

DRISHTI is an academic prototype developed for Smart India Hackathon 2026.

It is:

* Not clinically validated
* Not a certified medical device
* Not intended for diagnosis or treatment
* Not a replacement for qualified healthcare professionals
* Not evidence of clinical diagnostic accuracy

For the complete disclaimer, see:

[`docs/DISCLAIMER.md`](DISCLAIMER.md)
