# DRISHTI — Explainable AI for Diabetic Retinopathy Screening in Rural India

> **Smart India Hackathon 2026 — SIH26038**
> **Organization:** MathWorks
> **Theme:** Clean & Green Technology
> **Category:** Software

DRISHTI is an academic prototype for **explainable diabetic retinopathy (DR) screening** designed with rural and resource-constrained healthcare environments in mind.

The system combines **retinal image quality assessment, image enhancement, DR severity screening, explainability, automated reporting, and rural telemedicine capacity simulation** using MATLAB and Simulink.

> **Prototype status:** Academic/demo-level prototype. Not clinically validated and not intended for medical diagnosis.

---

## 1. Problem

Diabetic retinopathy is a diabetes-related eye disease that can cause vision impairment or blindness when it is not detected and managed appropriately.

In rural and underserved regions, screening can be affected by:

* Limited availability of ophthalmologists and trained specialists
* Variable quality of retinal fundus images
* Large screening workloads
* Delays in specialist review
* Limited visibility into how AI-based screening decisions are made

DRISHTI explores a technology-assisted workflow intended to support **early screening and prioritization for further clinical review**.

---

## 2. Proposed Solution

DRISHTI follows a multi-stage screening workflow:

```text
Fundus Image
     │
     ▼
Image Quality Gate
     │
     ├── Poor Quality ──► Recapture Feedback
     │
     ▼
Image Enhancement
     │
     ▼
DR Screening
(ICDR-style Grade 0–4)
     │
     ▼
Explainability
(Evidence Visualization)
     │
     ▼
Automated Report
     │
     ▼
Rural Telemedicine Capacity Simulation
```

The prototype focuses not only on screening but also on **image quality, evidence visualization, reporting, and healthcare workflow capacity**.

---

## 3. Current Prototype

The current prototype contains the following components:

### Image Quality Gate

The input fundus image is evaluated using prototype-level image quality indicators including:

* Focus/blur assessment
* Brightness/illumination assessment
* Dark-region analysis

The system can:

* Accept an image that passes the quality checks
* Reject a poor-quality image
* Provide recapture feedback for rejected images

### Image Enhancement

Accepted retinal images are processed to improve visual visibility.

The prototype incorporates enhancement concepts such as:

* CLAHE
* Illumination normalization
* Retinal image visibility improvement

### DR Screening

The prototype provides an **ICDR-style Grade 0–4 demonstration classification**.

Example demonstration output:

```text
Grade: 2
Classification: Moderate Non-Proliferative DR
Confidence: 87%
```

These values represent the current **prototype demonstration output** and must not be interpreted as clinically validated model performance.

### Explainability

DRISHTI generates visual evidence to make the screening workflow more interpretable.

Current prototype evidence includes:

* Bright-region evidence
* Dark-region evidence
* Local-variation evidence
* Lesion/evidence visualization

Future development can incorporate trained-model explainability approaches such as **Grad-CAM** and more detailed lesion-level explanations.

### Automated Report

The prototype generates a screening report containing information such as:

* Demo/Patient ID
* Image quality
* DR grade
* Classification
* Confidence
* Evidence
* Recommendation
* Timestamp

### Rural Telemedicine Capacity Simulation

The Simulink component models a simplified rural screening/review workflow.

The simulation considers concepts such as:

* Incoming screening demand
* AI screening
* Human review capacity
* Remaining review workload
* Backlog
* Peak incoming demand
* Peak review capacity

The objective is to demonstrate how AI-assisted screening could be studied alongside **limited specialist review capacity**.

---

## 4. Dataset

### Currently Used

The current prototype uses:

**APTOS 2019**

A subset containing exactly **100 PNG retinal images** is currently used for the prototype demonstration.

> The 100 images are a prototype subset and do not constitute clinical validation.

### Selected / Planned for Broader Validation

The following datasets have been selected/planned for future evaluation:

* DRIVE
* IDRiD
* MESSIDOR-2

These datasets are **not currently used in the implemented 100-image prototype**.

More information is available in:

[`docs/DATASETS.md`](docs/DATASETS.md)

---

## 5. Technology Stack

| Component              | Technology                                |
| ---------------------- | ----------------------------------------- |
| Programming / Analysis | MATLAB                                    |
| Application Interface  | MATLAB App Designer                       |
| System Simulation      | Simulink                                  |
| Image Processing       | MATLAB Image Processing workflows         |
| Explainability         | Evidence visualization / planned Grad-CAM |
| Dataset                | APTOS 2019 subset                         |
| Version Control        | Git + GitHub                              |

---

## 6. Repository Structure

```text
DRISHTI-SIH2026/
│
├── README.md
│
├── docs/
│   ├── PROJECT_OVERVIEW.md
│   ├── SYSTEM_ARCHITECTURE.md
│   ├── DATASETS.md
│   ├── PROTOTYPE_WORKFLOW.md
│   ├── MATLAB_SIMULINK.md
│   ├── RESULTS.md
│   ├── FUTURE_SCOPE.md
│   └── DISCLAIMER.md
│
├── src/
│   ├── DRISHTI_App.mlapp
│   ├── main.m
│   ├── run_demo.m
│   ├── quality_gate.m
│   ├── dr_classifier.m
│   ├── explainability.m
│   ├── generate_report.m
│   ├── create_lesion_reference.m
│   ├── create_blurry_test.m
│   └── rural_capacity_model.slx
│
├── data/
│   ├── README.md
│   └── APTOS prototype images
│
└── results/
    ├── README.md
    ├── enhanced_fundus.png
    ├── explainability_map.png
    ├── lesion_reference.png
    └── DRISHTI_Report.txt
```

---

## 7. MATLAB Prototype

The main MATLAB source components are:

| File                        | Purpose                                                    |
| --------------------------- | ---------------------------------------------------------- |
| `DRISHTI_App.mlapp`         | Graphical application interface                            |
| `main.m`                    | Main execution workflow                                    |
| `run_demo.m`                | End-to-end prototype demonstration                         |
| `quality_gate.m`            | Fundus image quality assessment                            |
| `dr_classifier.m`           | Prototype DR classification                                |
| `explainability.m`          | Evidence/explainability generation                         |
| `generate_report.m`         | Automated report generation                                |
| `create_lesion_reference.m` | Creates lesion/evidence reference visualization            |
| `create_blurry_test.m`      | Creates a blurry test image for quality-gate demonstration |
| `rural_capacity_model.slx`  | Simulink rural telemedicine capacity model                 |

---

## 8. Prototype Outputs

The prototype can generate outputs such as:

```text
Enhanced Fundus Image
        +
Explainability / Evidence Map
        +
Lesion Reference Visualization
        +
DR Screening Result
        +
Automated Report
```

Example output files are available in the [`results/`](results/) directory.

---

## 9. Prototype Demonstration

A MATLAB Online sharing link is available for viewing the DRISHTI prototype:

**[VIEW DRISHTI PROTOTYPE](https://drive.mathworks.com/sharing/a3c07093-9e5e-4929-e9e3-8e3e8a12704a)**

> Access to the shared `.mlapp` requires the appropriate MATLAB/MathWorks access.

---

## 10. Key Design Features

DRISHTI focuses on several aspects beyond basic image classification:

### 1. Image Quality Awareness

Poor-quality retinal images can affect screening reliability. The quality gate therefore evaluates the input before proceeding with the screening workflow.

### 2. Explainable Screening

The system provides visual evidence instead of presenting only a classification output.

### 3. Automated Reporting

Screening information is consolidated into a structured report for easier review and documentation.

### 4. Rural Workflow Simulation

Simulink is used to explore the relationship between incoming screening demand, AI-assisted processing, and limited human review capacity.

### 5. Modular Architecture

The MATLAB implementation is separated into individual modules so that components can be improved or replaced independently.

---

## 11. Current Status

| Component                        | Status                            |
| -------------------------------- | --------------------------------- |
| MATLAB prototype                 | Implemented                       |
| Fundus image input               | Implemented                       |
| Image quality gate               | Implemented                       |
| Image enhancement                | Implemented                       |
| Prototype DR classification      | Implemented                       |
| Evidence visualization           | Implemented                       |
| Automated report                 | Implemented                       |
| MATLAB App Designer interface    | Implemented                       |
| Simulink capacity model          | Implemented                       |
| APTOS 100-image prototype subset | Used                              |
| DRIVE                            | Planned                           |
| IDRiD                            | Planned                           |
| MESSIDOR-2                       | Planned                           |
| Clinical validation              | Not performed                     |
| IoT integration                  | Not included in current prototype |

---

## 12. Future Scope

Future development may include:

* Integration with IoT-enabled fundus imaging devices
* Training and evaluation of dedicated DR classification models
* Larger and more diverse retinal datasets
* Cross-dataset validation
* More robust lesion detection
* Grad-CAM-based model explanations
* Lesion-level explainability
* Confidence calibration
* Improved image-quality assessment
* More realistic rural telemedicine workload modelling
* Integration with appropriate clinical workflows
* Prospective clinical evaluation and validation

These are future directions and are not represented as completed capabilities of the current prototype.

---

## 13. Important Disclaimer

DRISHTI is an **academic research and demonstration prototype** developed for the Smart India Hackathon 2026 problem statement SIH26038.

The current implementation:

* Is not clinically validated
* Is not a certified medical device
* Must not be used for diagnosis or treatment decisions
* Does not replace an ophthalmologist or qualified healthcare professional
* Uses a limited 100-image APTOS prototype subset
* Contains demonstration-level classification outputs
* Does not establish clinical accuracy or real-world diagnostic performance

Any future clinical deployment would require appropriate dataset validation, clinical testing, regulatory assessment, security/privacy measures, and evaluation by qualified medical professionals.

See [`docs/DISCLAIMER.md`](docs/DISCLAIMER.md) for the complete disclaimer.

---

## 14. Documentation

Detailed project documentation is available here:

* [`Project Overview`](docs/PROJECT_OVERVIEW.md)
* [`System Architecture`](docs/SYSTEM_ARCHITECTURE.md)
* [`Datasets`](docs/DATASETS.md)
* [`Prototype Workflow`](docs/PROTOTYPE_WORKFLOW.md)
* [`MATLAB & Simulink`](docs/MATLAB_SIMULINK.md)
* [`Results`](docs/RESULTS.md)
* [`Future Scope`](docs/FUTURE_SCOPE.md)
* [`Disclaimer`](docs/DISCLAIMER.md)

Dataset information:

* [`Data README`](data/README.md)

Prototype outputs:

* [`Results README`](results/README.md)

---

## 15. Smart India Hackathon

**Problem Statement:** SIH26038
**Title:** Explainable AI for Diabetic Retinopathy Screening in Rural India
**Organization:** MathWorks
**Theme:** Clean & Green Technology
**Category:** Software
**Event:** Smart India Hackathon 2026

---

## 16. Project Team

**DRISHTI — SIH 2026**

Developed as an academic prototype for the Smart India Hackathon 2026 problem statement.

---

> **DRISHTI — From retinal image screening to explainable evidence and rural healthcare workflow simulation.**
